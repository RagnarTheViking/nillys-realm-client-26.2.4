package _2F_
{
   import flash.text.StyleSheet;
   
   public class _wR_
   {
       
      
      public var menuFont:String = "Arial";
      
      public var menuFontSize:int = 12;
      
      public var _0A_d:String = "Verdana";
      
      public var traceFontSize:int = 11;
      
      public var backgroundColor:uint;
      
      public var _0vc:Number = 0.9;
      
      public var controlColor:uint = 10027008;
      
      public var controlSize:uint = 5;
      
      public var commandLineColor:uint = 1092096;
      
      public var highColor:uint = 16777215;
      
      public var lowColor:uint = 12632256;
      
      public var _0lT_:uint = 12632256;
      
      public var _1l3:uint = 16746496;
      
      public var _0__K_:uint = 14505216;
      
      public var _B_1:uint = 16777215;
      
      public var _A_j:uint = 39372;
      
      public var priority0:uint = 3831610;
      
      public var priority1:uint = 4495684;
      
      public var priority2:uint = 7846775;
      
      public var priority3:uint = 10539168;
      
      public var priority4:uint = 14085846;
      
      public var priority5:uint = 15329769;
      
      public var priority6:uint = 16768477;
      
      public var priority7:uint = 16755370;
      
      public var priority8:uint = 16742263;
      
      public var priority9:uint = 16720418;
      
      public var priority10:uint = 16720418;
      
      public var priorityC1:uint = 39372;
      
      public var priorityC2:uint = 16746496;
      
      public var topMenu:Boolean = true;
      
      public var showCommandLineScope:Boolean = true;
      
      public var maxChannelsInMenu:int = 7;
      
      public var _16G_:int = 3;
      
      public var _A_5:int = 10;
      
      private var _1px:StyleSheet;
      
      public function _wR_()
      {
         super();
         this._1px = new StyleSheet();
      }
      
      public function _1kU_() : void
      {
         this.backgroundColor = 16777215;
         this.controlColor = 16724787;
         this.commandLineColor = 6736896;
         this.highColor = 0;
         this.lowColor = 3355443;
         this._0lT_ = 4473924;
         this._1l3 = 13373696;
         this._0__K_ = 8917248;
         this._B_1 = 0;
         this._A_j = 26282;
         this.priority0 = 4497476;
         this.priority1 = 3379251;
         this.priority2 = 2258722;
         this.priority3 = 1135889;
         this.priority4 = 13056;
         this.priority5 = 0;
         this.priority6 = 6684672;
         this.priority7 = 10027008;
         this.priority8 = 12255232;
         this.priority9 = 14483456;
         this.priority10 = 14483456;
         this.priorityC1 = 39372;
         this.priorityC2 = 16737792;
      }
      
      public function _Q_9() : void
      {
         this.traceFontSize = 13;
         this.menuFontSize = 14;
      }
      
      public function updateStyleSheet() : void
      {
         this._1px.setStyle("high",{
            "color":this._T_3(this.highColor),
            "fontFamily":this.menuFont,
            "fontSize":this.menuFontSize,
            "display":"inline"
         });
         this._1px.setStyle("low",{
            "color":this._T_3(this.lowColor),
            "fontFamily":this.menuFont,
            "fontSize":this.menuFontSize - 2,
            "display":"inline"
         });
         this._1px.setStyle("menu",{
            "color":this._T_3(this._1l3),
            "display":"inline"
         });
         this._1px.setStyle("menuHi",{
            "color":this._T_3(this._0__K_),
            "display":"inline"
         });
         this._1px.setStyle("chs",{
            "color":this._T_3(this._B_1),
            "fontSize":this.menuFontSize,
            "leading":"2",
            "display":"inline"
         });
         this._1px.setStyle("ch",{
            "color":this._T_3(this._A_j),
            "display":"inline"
         });
         this._1px.setStyle("tt",{
            "color":this._T_3(this._1l3),
            "fontFamily":this.menuFont,
            "fontSize":this.menuFontSize,
            "textAlign":"center"
         });
         this._1px.setStyle("r",{
            "textAlign":"right",
            "display":"inline"
         });
         this._1px.setStyle("p",{
            "fontFamily":this._0A_d,
            "fontSize":this.traceFontSize
         });
         this._1px.setStyle("p0",{
            "color":this._T_3(this.priority0),
            "display":"inline"
         });
         this._1px.setStyle("p1",{
            "color":this._T_3(this.priority1),
            "display":"inline"
         });
         this._1px.setStyle("p2",{
            "color":this._T_3(this.priority2),
            "display":"inline"
         });
         this._1px.setStyle("p3",{
            "color":this._T_3(this.priority3),
            "display":"inline"
         });
         this._1px.setStyle("p4",{
            "color":this._T_3(this.priority4),
            "display":"inline"
         });
         this._1px.setStyle("p5",{
            "color":this._T_3(this.priority5),
            "display":"inline"
         });
         this._1px.setStyle("p6",{
            "color":this._T_3(this.priority6),
            "display":"inline"
         });
         this._1px.setStyle("p7",{
            "color":this._T_3(this.priority7),
            "display":"inline"
         });
         this._1px.setStyle("p8",{
            "color":this._T_3(this.priority8),
            "display":"inline"
         });
         this._1px.setStyle("p9",{
            "color":this._T_3(this.priority9),
            "display":"inline"
         });
         this._1px.setStyle("p10",{
            "color":this._T_3(this.priority10),
            "fontWeight":"bold",
            "display":"inline"
         });
         this._1px.setStyle("p-1",{
            "color":this._T_3(this.priorityC1),
            "display":"inline"
         });
         this._1px.setStyle("p-2",{
            "color":this._T_3(this.priorityC2),
            "display":"inline"
         });
         this._1px.setStyle("logs",{
            "color":this._T_3(this._0lT_),
            "display":"inline"
         });
      }
      
      public function get styleSheet() : StyleSheet
      {
         return this._1px;
      }
      
      private function _T_3(param1:Number) : String
      {
         return "#" + param1.toString(16);
      }
   }
}
