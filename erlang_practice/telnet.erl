-module(telnet).
-export([tel/0]).

tel()->
  A = helo,
  valid_usr(A).
  

valid_usr(Msg)->
  Mid ="mail from:",
  receive X ->
            case X of
              Msg -> rec_mail(Msg,Mid);
              _ -> {recever ! "500 unrecognised command"},
                   valid_usr(Msg)
            end
   end.

rec_mail(Msg,Mid)->
  Rcp = 'rcpt to:',
  recever ! "Hello localhost",
  receive Y ->
            case Y of 
              Msg -> rec_mail(Msg,Mid);
              Mid -> rec_rcpt(Msg,Mid,Rcp);
              Rcp -> {recever ! "sender not yet given"},
                     rec_mail(Msg,Mid);
              _ -> {recever ! "500 unrecognised command"},
                   rec_mail(Msg,Mid)
            end
  end.

rec_rcpt(Msg,Mid,Rcp)->
  recever ! "Ok",
  D = data,
  receive P ->
            case P of 
              Mid -> {recever ! "Sender is already given"},
                     rec_rcpt(Msg,Mid,Rcp);
              Rcp -> {recever ! "Ok"},
                     rec_data();
              Msg -> {recever ! "Hello localhost"},
                     rec_rcpt(Msg,Mid,Rcp);
              D -> {recever !"Valid Rcpt command must presed data"},
                   rec_rcpt(Msg,Mid,Rcp);
              _ -> {recever ! "Unrecognised command"},
                   rec_rcpt(Msg,Mid,Rcp)
            end
  end.

rec_data()->ok.





  

