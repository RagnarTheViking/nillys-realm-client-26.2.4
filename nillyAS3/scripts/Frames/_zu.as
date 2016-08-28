package Frames
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import _1xa._1eo;
   import flash.events.MouseEvent;
   import _1xa.SText;
   import flash.display.Graphics;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.filters.DropShadowFilter;
   
   public class _zu extends Sprite
   {
      
      private static const _1P_p:int = 20;
       
      
      public var _16u:Sprite;
      
      public var text_:SimpleText;
      
      public var errorText_:SimpleText;
      
      private var _1Z_G_:Boolean;
      
      private var _1fa:Boolean;
      
      public function _zu(param1:String, param2:Boolean, param3:uint = 16)
      {
         super();
         this._1Z_G_ = param2;
         this._16u = new Sprite();
         this._16u.x = 2;
         this._16u.y = 2;
         this._00k();
         this._16u.addEventListener(MouseEvent.CLICK,this._1k9);
         addChild(this._16u);
         this.text_ = new SimpleText().setSize(param3).setColor(11776947);
         this.text_.setTextWidth(243);
         this.text_.x = this._16u.x + _1P_p + 8;
         this.text_.setBold(true);
         this.text_.setMultiLine(true);
         this.text_.setWordWrap(true);
         this.text_.setHTML(true);
         this.text_.setStringBuilder(new _dU_().setParams(param1));
         this.text_.mouseEnabled = true;
         this.text_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.text_);
         this.errorText_ = new SimpleText().setSize(12).setColor(16549442);
         this.errorText_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.errorText_);
         this.text_.textChanged.addOnce(this.onTextChanged);
      }
      
      public function _4y() : Boolean
      {
         return this._1Z_G_;
      }
      
      public function _0gM_(param1:String) : void
      {
         this.errorText_.setStringBuilder(new _dU_().setParams(param1));
      }
      
      public function _0F_I_(param1:_1eo) : void
      {
         this.text_.setStringBuilder(param1);
      }
      
      private function onTextChanged() : void
      {
         this.errorText_.x = this.text_.x;
         this.errorText_.y = this.text_.y + 20;
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         this.errorText_.setStringBuilder(new SText(""));
         this._1Z_G_ = !this._1Z_G_;
         this._00k();
      }
      
      public function _ur(param1:Boolean) : void
      {
         this._1fa = param1;
         this._00k();
      }
      
      private function _00k() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Graphics = this._16u.graphics;
         _loc2_.clear();
         _loc2_.beginFill(3355443,1);
         _loc2_.drawRect(0,0,_1P_p,_1P_p);
         _loc2_.endFill();
         if(this._1Z_G_)
         {
            _loc2_.lineStyle(4,11776947,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
            _loc2_.moveTo(2,2);
            _loc2_.lineTo(_1P_p - 2,_1P_p - 2);
            _loc2_.moveTo(2,_1P_p - 2);
            _loc2_.lineTo(_1P_p - 2,2);
            _loc2_.lineStyle();
            this._1fa = false;
         }
         if(this._1fa)
         {
            _loc1_ = 16549442;
         }
         else
         {
            _loc1_ = 4539717;
         }
         _loc2_.lineStyle(2,_loc1_,1,false,LineScaleMode.NORMAL,CapsStyle.ROUND,JointStyle.ROUND);
         _loc2_.drawRect(0,0,_1P_p,_1P_p);
         _loc2_.lineStyle();
      }
   }
}
