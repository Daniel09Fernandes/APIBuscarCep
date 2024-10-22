unit BuscaCep.view;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, System.ImageList,
  FMX.ImgList, MaskUtils, System.Skia, FMX.Skia;

type
  TfrBuscarCepView = class(TForm)
    RecTop: TRectangle;
    RecBody: TRectangle;
    lblTitulo: TLabel;
    EdtCep: TEdit;
    btnPesquisa: TSpeedButton;
    ImageList1: TImageList;
    EdtLogradouro: TEdit;
    EdtBairro: TEdit;
    EdtCidade: TEdit;
    EdtUF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblApi: TLabel;
    SkImgLoading: TSkAnimatedImage;
    procedure EdtCepExit(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frBuscarCepView: TfrBuscarCepView;

implementation

{$R *.fmx}
  uses BuscarCep.Controller;

procedure TfrBuscarCepView.EdtCepExit(Sender: TObject);
begin
  if (not EdtCep.Text.Trim.IsEmpty) and (not EdtCep.Text.Contains('-')) then
  begin
    EdtCep.Text := FormatMaskText('00000-000;0;', EdtCep.Text);

    if btnPesquisa.CanFocus then
      btnPesquisa.SetFocus;
  end;
end;

procedure TfrBuscarCepView.btnPesquisaClick(Sender: TObject);
begin
  if EdtCep.Text.Trim.IsEmpty then
  begin
    MessageDlg('Informe um CEP para buscar!', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK],0);
    exit;
  end;
  SkImgLoading.Visible := True;
  TThread.CreateAnonymousThread(
  procedure
  begin
    Var Controller := TBuscarCepController.Create;
    try
      var Entity := Controller.BuscaCep(EdtCep.Text);
      try
        TThread.Synchronize(nil,
        procedure
        begin
          SkImgLoading.Visible := false;
          if not Assigned(Entity) then
            exit;

          EdtLogradouro.Text := Entity.Logradouro;
          EdtBairro.Text := Entity.Bairro;
          EdtCidade.Text := Entity.Cidade;
          EdtUF.Text     := Entity.UF;
          lblApi.Text    := 'Consulta realizada na API: '+ Entity.Api;
        end);
      finally
        if Assigned(Entity) then
          Entity.Free;
      end;
    finally
      Controller.Free;
    end;
  end).Start;
end;

end.
