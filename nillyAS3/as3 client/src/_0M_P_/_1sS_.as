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
   import _C_._1O_I_;
   import flash.events.MouseEvent;
   
   class _1sS_ extends Sprite
   {
      
      public static const _1hU_:int = 400;
      
      public static const _me:int = 400;
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      private var text_:String;
      
      public var w_:int;
      
      public var h_:int;
      
      private var _1G___:_0H_R_;
      
      private var _1B_q:Sprite;
      
      private var _0__6:ScrollBar;
      
      private var _0yG_:Button;
      
      private var _0V___:Button;
      
      private var _0O_n:GraphicsSolidFill;
      
      private var outlineFill_:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var path_:GraphicsPath;
      
      function _1sS_(param1:String)
      {
         this._0O_n = new GraphicsSolidFill(3355443,1);
         this.outlineFill_ = new GraphicsSolidFill(16777215,1);
         this._0pt = new GraphicsStroke(2,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this.outlineFill_);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._0O_n,this.path_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         super();
         this.text_ = param1;
         this._1B_q = new Sprite();
         var _loc2_:Shape = new Shape();
         var _loc3_:Graphics = _loc2_.graphics;
         _loc3_.beginFill(0);
         _loc3_.drawRect(0,0,_1hU_,_me);
         _loc3_.endFill();
         this._1B_q.addChild(_loc2_);
         this._1B_q.mask = _loc2_;
         addChild(this._1B_q);
         this._1G___ = new _0H_R_(16,11776947,true,_1hU_,_me);
         this._1G___.border = false;
         this._1G___.mouseEnabled = true;
         this._1G___.multiline = true;
         this._1G___.wordWrap = true;
         this._1G___.text = param1;
         this._1G___._13s();
         this._1G___.addEventListener(Event.CHANGE,this._W_8);
         this._1G___.addEventListener(Event.SCROLL,this._W_8);
         this._1B_q.addChild(this._1G___);
         this._0__6 = new ScrollBar(16,_me - 4);
         this._0__6.x = _1hU_ + 6;
         this._0__6.y = 0;
         this._0__6._0jj(400,this._1G___.height);
         this._0__6.addEventListener(Event.CHANGE,this._0f0);
         addChild(this._0__6);
         this.w_ = _1hU_ + 26;
         this._0yG_ = new Button(14,_1O_I_._0cV_,120);
         this._0yG_.x = 4;
         this._0yG_.y = _me + 4;
         this._0yG_.addEventListener(MouseEvent.CLICK,this.onCancel);
         addChild(this._0yG_);
         this._0V___ = new Button(14,_1O_I_._C_G_,120);
         this._0V___.x = this.w_ - 124;
         this._0V___.y = _me + 4;
         this._0V___.addEventListener(MouseEvent.CLICK,this._F_S_);
         this._0V___.textChanged.add(this._0qU_);
         addChild(this._0V___);
      }
      
      private function _0qU_() : void
      {
         this.h_ = _me + this._0V___.height + 8;
         x = 800 / 2 - this.w_ / 2;
         y = 600 / 2 - this.h_ / 2;
         graphics.clear();
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(-6,-6,this.w_ + 12,this.h_ + 12,4,[1,1,1,1],this.path_);
         graphics.drawGraphicsData(this.graphicsData_);
         this._0__6._0jj(_me,this._1G___.textHeight,false);
      }
      
      public function _1g8() : String
      {
         return encodeURIComponent(this._1G___.text);
      }
      
      private function _0f0(param1:Event) : void
      {
         this._1G___.scrollV = 1 + this._0__6._zH_() * this._1G___.maxScrollV;
      }
      
      private function onCancel(param1:Event) : void
      {
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      private function _F_S_(param1:Event) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function _W_8(param1:Event) : void
      {
         if(this._0__6 == null)
         {
            return;
         }
         this._0__6._0jj(_me,this._1G___.textHeight,false);
         if(this._1G___.maxScrollV == 1)
         {
            this._0__6._1mX_(0);
         }
         else
         {
            this._0__6._1mX_((this._1G___.scrollV - 1) / (this._1G___.maxScrollV - 1));
         }
      }
   }
}
