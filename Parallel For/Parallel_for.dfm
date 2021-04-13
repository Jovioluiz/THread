object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 32
    Top = 128
    Width = 105
    Height = 73
    Lines.Strings = (
      '')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 32
    Top = 97
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 360
    Top = 39
    Width = 105
    Height = 252
    Lines.Strings = (
      '')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 360
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button2Click
  end
end
