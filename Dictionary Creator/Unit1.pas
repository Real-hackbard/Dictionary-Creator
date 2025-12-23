unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, System.StrUtils, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Samples.Spin,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    RichEdit1: TRichEdit;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Edit1: TEdit;
    Button3: TButton;
    Button2: TButton;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    Label4: TLabel;
    SpinEdit2: TSpinEdit;
    Copy1: TMenuItem;
    Selectall1: TMenuItem;
    Clear1: TMenuItem;
    FontDialog1: TFontDialog;
    Font1: TMenuItem;
    N1: TMenuItem;
    Label5: TLabel;
    SpinEdit3: TSpinEdit;
    CheckBox1: TCheckBox;
    Cut1: TMenuItem;
    N2: TMenuItem;
    Zebra1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Selectall1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure RichEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Cut1Click(Sender: TObject);
    procedure Zebra1Click(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
  private
    { Déclarations privées }
  public
    procedure allkey(chaine: String; maxlen: Integer);
    procedure pOut(chaine:String);
  end;

var
  Form1: TForm1;
  dico: string;
  cnt,cnt2,maxlen : integer;
  stop : boolean;

const
  KEY_CTRL_B = 02;
  KEY_CTRL_I =  9;
  KEY_CTRL_S = 19;
  KEY_CTRL_U = 21;

implementation

{$R *.dfm}
procedure ApplyZebraEffect(RichEdit: TRichEdit; Color1, Color2: TColor);
var
  i: Integer;
begin
  RichEdit.Lines.BeginUpdate;
  try
    for i := 0 to RichEdit.Lines.Count - 1 do
    begin
      // Select the entire line
      RichEdit.SelStart := RichEdit.Perform(EM_LINEINDEX, i, 0);
      RichEdit.SelLength := RichEdit.Perform(EM_LINELENGTH, RichEdit.SelStart, 0);

      // Apply alternating background color
      if Form1.Zebra1.Checked = true then
      begin
        if Odd(i) then
        begin
          RichEdit.SelAttributes.BackColor := Color1;
        end else begin
          RichEdit.SelAttributes.BackColor := Color2;
        end;
      end;

      // cancel alternating background color
      if Form1.Zebra1.Checked = false then
      begin
        if Odd(i) then
        begin
          RichEdit.SelAttributes.BackColor := clWhite;
        end else begin
          RichEdit.SelAttributes.BackColor := clWhite;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    RichEdit.Lines.EndUpdate;
  end;
end;

procedure TForm1.allkey(chaine: String; maxlen: Integer);
var
  i : integer;
begin
  if stop then
  begin
    Timer1.Enabled:= false;
    exit;
  end;

  if (Length(chaine) < maxlen) then
    for i := 1 To Length(dico) do
    allkey(chaine + Midstr(dico, i, 1), maxlen )
      else
    if (Length(chaine) = maxlen) then pOut (chaine);
end;

procedure TForm1.pOut(chaine: String);
var
  s : string;
begin
  if CheckBox1.Checked = true then
  begin
    RichEdit1.SelStart := MAXINT;
    RichEdit1.Paragraph.Alignment := taCenter;
  end;

  s := '                              ';
  if (cnt mod SpinEdit2.Value = 0) then RichEdit1.lines.Add('');

  RichEdit1.Lines.BeginUpdate;
  RichEdit1.Lines.Strings[RichEdit1.Lines.Count-1] := RichEdit1.Lines.Strings[RichEdit1.Lines.Count-1] +
                                                      Copy(s, 1, SpinEdit3.Value) +
                                                      chaine;
  RichEdit1.Lines.EndUpdate;
  cnt := cnt + 1;
  Application.ProcessMessages;
end;

procedure TForm1.RichEdit1Change(Sender: TObject);
begin
  if RichEdit1.Lines.Count > 0 then
  Zebra1.Enabled := true;
end;

procedure TForm1.RichEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  case Ord(Key) of
    KEY_CTRL_B: begin
      Key := #0;
      if fsBold in (Sender as TRichEdit).SelAttributes.Style then
      (Sender as TRichEdit).SelAttributes.Style :=
        (Sender as TRichEdit).SelAttributes.Style - [fsBold] else
      (Sender as TRichEdit).SelAttributes.Style :=
        (Sender as TRichEdit).SelAttributes.Style + [fsBold];
    end;
    KEY_CTRL_I: begin
      Key := #0;
      if fsItalic in
      (Sender as TRichEdit).SelAttributes.Style then
        (Sender as TRichEdit).SelAttributes.Style :=
        (Sender as TRichEdit).SelAttributes.Style - [fsItalic]
      else
       (Sender as TRichEdit).SelAttributes.Style :=
       (Sender as TRichEdit).SelAttributes.Style + [fsItalic];
    end;
    KEY_CTRL_S: begin
       Key := #0;
      if fsStrikeout in
      (Sender as TRichEdit).SelAttributes.Style then
        (Sender as TRichEdit).SelAttributes.Style :=
        (Sender as TRichEdit).SelAttributes.Style - [fsStrikeout]
      else
        (Sender as TRichEdit).SelAttributes.Style :=
        (Sender as TRichEdit).SelAttributes.Style + [fsStrikeout];
    end;
    KEY_CTRL_U: begin
       Key := #0;
      if fsUnderline in
      (Sender as TRichEdit).SelAttributes.Style then
        (Sender as TRichEdit).SelAttributes.Style :=
        (Sender as TRichEdit).SelAttributes.Style - [fsUnderline]
      else
        (Sender as TRichEdit).SelAttributes.Style :=
        (Sender as TRichEdit).SelAttributes.Style + [fsUnderline];
    end;
  end;
end;

procedure TForm1.Selectall1Click(Sender: TObject);
begin
  RichEdit1.Perform(EM_SETSEL,0,-1);
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    RichEdit1.Perform(EM_SETSEL,0,-1);
    RichEdit1.Font := FontDialog1.Font;
    Richedit1.SelAttributes.Name := FontDialog1.Font.Name;
    Richedit1.SelAttributes.Size := FontDialog1.Font.Size;
    Richedit1.SelAttributes.Style := FontDialog1.Font.Style;

    RichEdit1.SelStart := 0;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
const
  ScrollBarA: array[0..3] of TScrollStyle = (ssBoth, ssHorizontal, ssNone, ssVertical);

begin
  RichEdit1.ScrollBars := ScrollBarA[0];
  RichEdit1.WordWrap := False;
  RichEdit1.DoubleBuffered := true;
  RichEdit1.MaxLength := $7FFFFFF0;
  cnt := 0;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i : integer;
begin
    Timer1.Enabled := true;
    stop := false;
    cnt := 0;
    cnt2 := 0;
    RichEdit1.Clear;
    dico := Edit1.text;
    maxlen := SpinEdit1.Value;
    for i := 1 to maxlen do
    allkey('',i);
end;

procedure TForm1.Clear1Click(Sender: TObject);
begin
  RichEdit1.Clear;
  Zebra1.Checked := false;
  Zebra1.Enabled := false;
end;

procedure TForm1.Copy1Click(Sender: TObject);
begin
  RichEdit1.Perform(WM_COPY,0,0);
end;

procedure TForm1.Cut1Click(Sender: TObject);
begin
  RichEdit1.CutToClipboard;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := IntToStr(cnt-cnt2) + ' results per second';
  StatusBar1.Panels[2].Text := IntToStr(RichEdit1.Lines.Count);
  cnt2 := cnt;
end;

procedure TForm1.Zebra1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  ApplyZebraEffect(RichEdit1, clWhite, clSilver);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  stop := true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  RichEdit1.PlainText := True ;
  if SaveDialog1.Execute then
    RichEdit1.Lines.SaveToFile(SaveDialog1.FileName + '.txt');
end;

end.
