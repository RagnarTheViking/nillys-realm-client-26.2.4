package _0M_P_
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import com.company.ui._0H_R_;
   import com.company.assembleegameclient.ui.ScrollBar;
   import com.company.assembleegameclient.ui.Button;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import com.company.util.GraphicHelper;
   import flash.events.Event;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.display.Shape;
   import flash.display.Graphics;
   import com.company.util._0O_k;
   import _C_._1O_I_;
   import flash.events.MouseEvent;
   
   class _0Z_l extends Sprite
   {
      
      public static const _1hU_:int = 400;
      
      public static const _me:int = 400;
      
      private static const _de:RegExp = /((https?|ftp):((\/\/)|(\\\\))+[\w\d:#@%\/;$()~_?\+-=\\\.&]*)/g;
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      private var text_:String;
      
      public var w_:int;
      
      public var h_:int;
      
      private var _1G___:_0H_R_;
      
      private var _1B_q:Sprite;
      
      private var _0__6:ScrollBar;
      
      private var _0ff:Button;
      
      private var _0H_V_:Button;
      
      private var _0O_n:GraphicsSolidFill;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var path_:GraphicsPath;
      
      function _0Z_l(param1:String, param2:Boolean)
      {
         this._0O_n = new GraphicsSolidFill(3355443,1);
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this._0pt = new GraphicsStroke(2,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._0O_n,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         this.text_ = param1;
         this._1B_q = new Sprite();
         var _loc3_:Shape = new Shape();
         var _loc4_:Graphics = _loc3_.graphics;
         _loc4_.beginFill(0);
         _loc4_.drawRect(0,0,_1hU_,_me);
         _loc4_.endFill();
         this._1B_q.addChild(_loc3_);
         this._1B_q.mask = _loc3_;
         addChild(this._1B_q);
         var _loc5_:String = _0O_k.escape(param1);
         _loc5_ = _loc5_.replace(_de,"<font color=\"#7777EE\"><a href=\"$1\" target=\"_blank\">" + "$1</a></font>");
         this._1G___ = new _0H_R_(16,11776947,false,_1hU_,0);
         this._1G___.border = false;
         this._1G___.mouseEnabled = true;
         this._1G___.multiline = true;
         this._1G___.wordWrap = true;
         this._1G___.htmlText = _loc5_;
         this._1G___._13s();
         this._1B_q.addChild(this._1G___);
         var _loc6_:* = this._1G___.height > 400;
         if(_loc6_)
         {
            this._0__6 = new ScrollBar(16,_me - 4);
            this._0__6.x = _1hU_ + 6;
            this._0__6.y = 0;
            this._0__6._0jj(400,this._1G___.height);
            this._0__6.addEventListener(Event.CHANGE,this._0f0);
            addChild(this._0__6);
         }
         this.w_ = _1hU_ + (!!_loc6_?26:0);
         this._0ff = new Button(14,_1O_I_._1T_j,120);
         this._0ff.x = 4;
         this._0ff.y = _me + 4;
         this._0ff.addEventListener(MouseEvent.CLICK,this._1S_v);
         addChild(this._0ff);
         this._0ff.visible = param2;
         this._0H_V_ = new Button(14,_1O_I_._1w1,120);
         this._0H_V_.x = this.w_ - 124;
         this._0H_V_.y = _me + 4;
         this._0H_V_.addEventListener(MouseEvent.CLICK,this._fH_);
         this._0H_V_.textChanged.addOnce(this._0qU_);
         addChild(this._0H_V_);
      }
      
      private function _0qU_() : void
      {
         this.h_ = _me + this._0H_V_.height + 8;
         x = 800 / 2 - this.w_ / 2;
         y = 600 / 2 - this.h_ / 2;
         graphics.clear();
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(-6,-6,this.w_ + 12,this.h_ + 12,4,[1,1,1,1],this.path_);
         graphics.drawGraphicsData(this.graphicsData_);
      }
      
      private function _0f0(param1:Event) : void
      {
         this._1G___.y = -this._0__6._zH_() * (this._1G___.height - 400);
      }
      
      private function _1S_v(param1:Event) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function _fH_(param1:Event) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
