package _0wX_
{
   import _4Z_._6z;
   import flash.text.TextField;
   import _T_n._1gJ_;
   import flash.display.Shape;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.Event;
   import _0E_Z_._0W_y;
   import _C_._0C_J_;
   import flash.text.TextFormat;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import _0H_6.GameContext;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import _0xn._1uk;
   
   public class _L_I_ extends _6z
   {
       
      
      public var _1td:Boolean = false;
      
      private var _1aB_:TextField;
      
      private var _bl:_1gJ_ = null;
      
      private var _catch:Vector.<Shape>;
      
      private var _iM_:int = 0;
      
      private var _9B_:int = 1;
      
      private var _I_K_:int = 0;
      
      private var _05l:TextField;
      
      private var _1sO_:Bitmap;
      
      private var _09K_:Sprite;
      
      private var _1kb:Sprite;
      
      private var _1H_P_:Number = 0.018;
      
      private var _H_Z_:Boolean = false;
      
      public function _L_I_(param1:Boolean = false, param2:Boolean = false)
      {
         var _loc3_:Shape = null;
         var _loc4_:int = 0;
         this._catch = new Vector.<Shape>();
         super();
         if(param1)
         {
            this._1td = param1;
            addEventListener(MouseEvent.ROLL_OVER,this._9I_);
         }
         _0vi(true,16689154,true);
         if(param2)
         {
            _loc4_ = 0;
            while(_loc4_ < 3)
            {
               _loc3_ = _1uk._17F_(56 + _loc4_ * 10,5526612,-5 + -5 * _loc4_,false,true,4);
               addChild(_loc3_);
               this._catch.push(_loc3_);
               _loc4_++;
            }
            this._I_K_ = this._catch.length - 1;
            addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      override public function updateTitle() : void
      {
         if(!_Z_0)
         {
            this._1an(196098);
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            if(this._bl)
            {
               this._bl._00Y_(196098);
               this._bl.draw();
            }
            if(this._09K_ != null && this._09K_.parent != null)
            {
               this._1kb.visible = false;
               this._1kb.alpha = 0;
               this._09K_.alpha = 1;
            }
         }
         else
         {
            if(this._catch.length > 0)
            {
               addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
            }
            if(this._09K_ != null && this._09K_.parent != null)
            {
               this._1kb.visible = true;
            }
            if(this._bl)
            {
               this._bl._00Y_(5526612);
               this._bl.draw();
            }
         }
      }
      
      public function _P_i() : void
      {
         this._1an(16711680);
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         new _0W_y(1.25,addEventListener,Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public function _8T_() : void
      {
         if(this._05l == null)
         {
            this._05l = this._J_w();
            this._05l.text = "✓";
            this._05l.textColor = 65280;
            addChild(this._05l);
            this._05l.y = Math.round((height / 2 - this._05l.textHeight / 2) / 7);
         }
      }
      
      public function _0ay() : void
      {
         if(this._05l == null)
         {
            this._05l = this._J_w();
            this._05l.text = "?";
            this._05l.textColor = 16711680;
            addChild(this._05l);
            this._05l.y = Math.round((height / 2 - this._05l.textHeight / 2) / 7);
         }
      }
      
      public function _zz() : void
      {
         if(this._05l != null && this._05l.parent != null)
         {
            removeChild(this._05l);
         }
      }
      
      private function _J_w() : TextField
      {
         var _loc1_:_0C_J_ = new _0C_J_();
         var _loc2_:TextField = new TextField();
         var _loc3_:TextFormat = _loc2_.defaultTextFormat;
         _loc3_.size = 36;
         _loc3_.font = _loc1_._7X_().getName();
         _loc3_.bold = true;
         _loc3_.align = "center";
         _loc2_.defaultTextFormat = _loc3_;
         _loc2_.alpha = 0.8;
         _loc2_.width = width;
         _loc2_.selectable = false;
         return _loc2_;
      }
      
      private function _9I_(param1:Event) : void
      {
         if(_Z_0)
         {
            this._H_Z_ = true;
            if(this._1aB_ != null && this._1aB_.parent == null)
            {
               addChild(this._1aB_);
            }
            removeEventListener(MouseEvent.ROLL_OVER,this._9I_);
            addEventListener(MouseEvent.ROLL_OUT,this._ui);
         }
      }
      
      private function _ui(param1:Event) : void
      {
         if(_Z_0)
         {
            this._H_Z_ = false;
            new _0W_y(0.5,this._1wz);
            addEventListener(MouseEvent.ROLL_OVER,this._9I_);
            removeEventListener(MouseEvent.ROLL_OUT,this._ui);
         }
      }
      
      private function _1wz() : void
      {
         if(this._H_Z_ == false && this._1aB_ != null && this._1aB_.parent != null)
         {
            removeChild(this._1aB_);
         }
      }
      
      public function _0U_u(param1:String, param2:int, param3:int) : void
      {
         this._1aB_ = new TextField();
         this._1aB_.text = param1;
         this._1aB_.autoSize = TextFieldAutoSize.LEFT;
         var _loc4_:_0C_J_ = GameContext.getInjector().getInstance(_0C_J_);
         _loc4_.apply(this._1aB_,param2,param3,false,true);
         this._1aB_.y = this.y + this.height;
         this._1aB_.x = this.x + this.width / 2 - this._1aB_.width / 2;
      }
      
      public function _1hM_(param1:_1gJ_) : void
      {
         this._bl = param1;
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:ColorTransform = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = uint(getTimer() / 500 % 3);
         if(_loc5_ != this._iM_)
         {
            this._iM_ = _loc5_;
            _loc3_ = 0;
            while(_loc3_ < this._catch.length)
            {
               _loc2_ = this._catch[_loc3_].transform.colorTransform;
               _loc2_.color = 5526612;
               _loc2_.alphaMultiplier = 1 - _loc3_ * 0.3;
               this._catch[_loc3_].transform.colorTransform = _loc2_;
               _loc3_++;
            }
            _loc4_ = this._I_K_ - this._iM_ * this._9B_;
            _loc2_ = this._catch[_loc4_].transform.colorTransform;
            _loc2_.color = 196098;
            this._catch[_loc4_].transform.colorTransform = _loc2_;
         }
         if(this._1sO_)
         {
            if(this._09K_.alpha == 1 || this._09K_.alpha == 0)
            {
               this._1H_P_ = this._1H_P_ * -1;
            }
            this._09K_.alpha = this._09K_.alpha + this._1H_P_;
            this._1kb.alpha = this._1kb.alpha - this._1H_P_;
            if(this._09K_.alpha >= 1)
            {
               this._09K_.alpha = 1;
               this._1kb.alpha = 0;
            }
            else if(this._09K_.alpha <= 0)
            {
               this._09K_.alpha = 0;
               this._1kb.alpha = 1;
            }
         }
      }
      
      public function _1an(param1:int) : void
      {
         var _loc2_:ColorTransform = null;
         var _loc3_:int = this._catch.length - 1;
         while(_loc3_ >= 0)
         {
            _loc2_ = this._catch[_loc3_].transform.colorTransform;
            _loc2_.color = param1;
            _loc2_.alphaMultiplier = 1 - _loc3_ * 0.3;
            this._catch[_loc3_].transform.colorTransform = _loc2_;
            _loc3_--;
         }
      }
      
      public function _1ew(param1:int) : void
      {
         this._9B_ = param1;
         if(param1 == -1)
         {
            this._I_K_ = 0;
         }
         else if(param1 == 1)
         {
            this._I_K_ = this._catch.length - 1;
         }
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public function _r2() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public function _dZ_(param1:Bitmap) : void
      {
         this._1sO_ = param1;
         var _loc2_:Bitmap = new Bitmap(param1.bitmapData);
         this._09K_ = new Sprite();
         this._1kb = new Sprite();
         this._09K_.x = (100 - this._1sO_.width) * 0.5;
         this._09K_.y = (46 - this._1sO_.height) * 0.5;
         this._1kb.x = this._09K_.x;
         this._1kb.y = this._09K_.y;
         this._09K_.addChild(this._1sO_);
         this._1kb.addChild(_loc2_);
         addChild(this._1kb);
         addChild(this._09K_);
         if(itemSprite != null && getChildIndex(itemSprite) != -1)
         {
            removeChild(itemSprite);
            addChild(itemSprite);
         }
         this._09K_.filters = [_0sK_];
         var _loc3_:ColorTransform = new ColorTransform();
         _loc3_.color = 2697513;
         this._09K_.transform.colorTransform = _loc3_;
         this._1kb.alpha = 0;
      }
   }
}
