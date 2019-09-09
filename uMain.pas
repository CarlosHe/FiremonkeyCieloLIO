unit uMain;

interface

uses
  FMX.Platform.Android,
  Androidapi.AppGlue,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,

  System.SysUtils, System.Types,
  System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Android.CieloLIO, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TMain = class(TForm)
    Button2: TButton;
    Text1: TText;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyServiceBindListener = class(TJavaLocal, JServiceBindListener)
  public
    procedure onServiceBound; cdecl;
    procedure onServiceBoundError(P1: JThrowable); cdecl;
    procedure onServiceUnbound; cdecl;
  end;

  TMyPaymentListener = class(TJavaLocal, JPaymentListener)
  public
    procedure onCancel; cdecl;
    procedure onError(P1: JPaymentError); cdecl;
    procedure onPayment(P1: JOrder); cdecl;
    procedure onStart; cdecl;
  end;

var
  Main: TMain;
  OrderManager: JOrderManager;
  ServiceBindListener: TMyServiceBindListener;
  PaymentListener: TMyPaymentListener;

implementation

{$R *.fmx}
{ TServiceBindListener }

procedure TMyServiceBindListener.onServiceBound;
begin
  Form3.Button2.Enabled := True;
end;

procedure TMyServiceBindListener.onServiceBoundError(P1: JThrowable);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      ShowMessage(JStringToString(P1.toString));
    end);

end;

procedure TMyServiceBindListener.onServiceUnbound;
begin
  Form3.Button2.Enabled := False;
end;

{ TMyPaymentListener }

procedure TMyPaymentListener.onCancel;
begin
  Form3.Text1.Text := 'CANCELED';

end;

procedure TMyPaymentListener.onError(P1: JPaymentError);
begin
  Form3.Text1.Text := 'ERROR = ' + JStringToString(P1.getDescription);
end;

procedure TMyPaymentListener.onPayment(P1: JOrder);
begin
  Form3.Text1.Text := 'SALE ID = ' + JStringToString(P1.getId) + #10#13 + ' VALUE = ' + P1.paidAmount.toString + #10#13 + 'REMAINING VALUE = ' + P1.getPendingAmount.toString +
    #10#13 + 'STATUS = ' + JStringToString(P1.getStatus.toString);
end;

procedure TMyPaymentListener.onStart;
begin

end;

procedure TMain.Button2Click(Sender: TObject);
var
  LOrder: JOrder;
begin

  LOrder := OrderManager.createDraftOrder(StringToJString('00001'));
  LOrder.addItem(StringToJString('2891820317391823'), StringToJString('Coca-cola'), 550, 3, StringToJString('UNIDADE'));

  OrderManager.placeOrder(LOrder);

  OrderManager.checkoutOrder(LOrder.getId, 2000, PaymentListener);
end;

initialization

ServiceBindListener := TMyServiceBindListener.Create;

PaymentListener := TMyPaymentListener.Create;

OrderManager := TJOrderManager.JavaClass.init(TJdomain_Credentials.JavaClass.init(StringToJString('YOUR CLIENT ID HERE'), StringToJString('YOUR ACCESS TOKEN HERE')),
  SharedActivityContext);

OrderManager.bind(SharedActivity, ServiceBindListener);

end.
