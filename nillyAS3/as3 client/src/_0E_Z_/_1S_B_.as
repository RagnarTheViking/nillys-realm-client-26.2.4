package _0E_Z_
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import flash.text.TextField;
   import flash.filters.GlowFilter;
   import flash.events.Event;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import _1xa._dU_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.text.TextFieldAutoSize;
   import _T_J_.GTween;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.filters.ColorMatrixFilter;
   import com.company.util.MoreColorUtil;
   
   public class _1S_B_ extends Sprite
   {
      
      public static const _0V_x:int = 1;
      
      public static const _Q_i:int = 2;
      
      public static const _1L_E_:int = 3;
      
      private static const _0k7:int = 100;
      
      public static const _D_5:int = 1;
      
      public static const _Q_s:int = 2;
      
      private static const _0hI_:Number = 5;
       
      
      private const _0F_6:Number = 3;
      
      private const _041:Number = 80;
      
      private const _dX_:int = 3500;
      
      public var _0o5:Bitmap;
      
      public var _1C_o:Bitmap;
      
      private var item:_0E_Z_._0qm;
      
      private var _D_f:Number;
      
      private var _V_1:Number;
      
      private var _1mf:Vector.<Bitmap>;
      
      private var _18O_:Number = 50;
      
      private var _0aS_:Boolean = false;
      
      private var _08p:Boolean = false;
      
      public var active:Boolean = false;
      
      private var _1G_6:Number = 0;
      
      private var _1R_R_:Number = 0;
      
      private var _Q_F_:Number = 0;
      
      private var _1__A_:Number;
      
      public var _pA_:int;
      
      public var size_:int = 100;
      
      private var _0oC_:TextField;
      
      private var _lp:Number = 0;
      
      private var _1P_A_:Number = 0;
      
      private var _0J_N_:Boolean = false;
      
      private var _0S_8:int = 0;
      
      private var _nk:int = -1;
      
      private var _0fI_:Boolean = false;
      
      private var _0W___:GlowFilter;
      
      public function _1S_B_()
      {
         var _loc1_:BitmapData = null;
         var _loc2_:uint = 0;
         this._0oC_ = new TextField();
         super();
         this._1mf = new Vector.<Bitmap>();
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,16777215,true);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 16 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,16777215,true);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 32 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,16777215,true);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 48 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,16777215,true);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 64 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,16777215,true);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < 8)
         {
            _loc1_ = TextureLibrary.getBitmap("lofiCharBig",this._041 + 80 + _loc2_);
            _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,16777215,true);
            this._1mf.push(new Bitmap(_loc1_));
            _loc2_++;
         }
         _loc1_ = TextureLibrary.getBitmap("lofiCharBig",256);
         _loc1_ = TextureRedrawer.redraw(_loc1_,this.size_,true,0,true);
         this._0o5 = new Bitmap(_loc1_);
         this._0o5.alpha = 0;
         addChild(this._0o5);
         this._1C_o = new Bitmap(_loc1_);
         this._1C_o.filters = [new ColorMatrixFilter(MoreColorUtil._iz)];
         this._1C_o.alpha = 1;
         this.active = false;
         addChild(this._1C_o);
         this._0W___ = new GlowFilter(49151,1,45,45,1.5);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver,false,0,true);
         addEventListener(MouseEvent.ROLL_OUT,this._0W_X_,false,0,true);
         this.setInactive();
      }
      
      public function setXPos(param1:Number) : void
      {
         this.x = param1 - this.width / 2;
      }
      
      public function setYPos(param1:Number) : void
      {
         this.y = param1 - this.height / 2;
      }
      
      private function _0H_m(param1:Number) : Number
      {
         return param1 - this.width / 2;
      }
      
      private function _1w3(param1:Number) : Number
      {
         return param1 - this.height / 2;
      }
      
      public function getCenterX() : Number
      {
         return this.x + this.width / 2;
      }
      
      public function getCenterY() : Number
      {
         return this.y + this.height / 2;
      }
      
      public function returnCenterX() : Number
      {
         return this._D_f + this.width / 2;
      }
      
      public function returnCenterY() : Number
      {
         return this._V_1 + this.width / 2;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         this.removeItemReveal();
         this._0o5 = null;
         this._1C_o = null;
         this.item = null;
         this._1mf = null;
      }
      
      public function setGlowState(param1:int) : void
      {
         this._nk = param1;
         if(this._nk == _Q_s)
         {
            this._0W___.alpha = 1;
         }
      }
      
      public function _1kC_(param1:int) : void
      {
         if(this.parent == null || this.parent.parent == null)
         {
            return;
         }
         this.removeItemReveal();
         this.item = new _0E_Z_._0qm(param1);
         this.item._7v.alpha = 1;
         parent.addChild(this.item);
         this.item.setXPos(this.getCenterX());
         this.item.setYPos(this.getCenterY());
         _1tn._0xq(this.item,{
            "scaleX":1.25,
            "scaleY":1.25
         },{
            "scaleX":1,
            "scaleY":1
         });
         this.setInactive();
      }
      
      public function removeItemReveal() : void
      {
         if(this.item != null && this.item.parent)
         {
            parent.removeChild(this.item);
         }
         if(this._0oC_ != null && this._0oC_.parent)
         {
            parent.removeChild(this._0oC_);
         }
      }
      
      public function doItemShow(param1:int) : void
      {
         if(this.parent == null || this.parent.parent == null)
         {
            return;
         }
         this.removeItemReveal();
         var _loc2_:TextFormat = new TextFormat();
         _loc2_.size = 18;
         _loc2_.font = "Myriad Pr";
         _loc2_.bold = false;
         _loc2_.align = TextFormatAlign.LEFT;
         _loc2_.leftMargin = 0;
         _loc2_.indent = 0;
         _loc2_.leading = 0;
         this._0oC_.text = _dU_._ss(ObjectLibrary._O_S_[param1]);
         this._0oC_.textColor = 16777215;
         this._0oC_.autoSize = TextFieldAutoSize.CENTER;
         this._0oC_.selectable = false;
         this._0oC_.defaultTextFormat = _loc2_;
         this._0oC_.setTextFormat(_loc2_);
         this.item = new _0E_Z_._0qm(param1,_0k7);
         this.item._7v.alpha = 1;
         parent.addChild(this.item);
         this.item.alpha = 0;
         this.item.setXPos(this.getCenterX());
         this.item.setYPos(this.getCenterY());
         this._0oC_.x = this.item.getCenterX() - this._0oC_.width / 2;
         this._0oC_.y = this.item.y + 80;
         parent.addChild(this._0oC_);
         var _loc3_:GTween = new GTween(this.item,1,{"alpha":1});
         _1tn._0xq(this.item,{
            "scaleX":1.25,
            "scaleY":1.25
         },{
            "scaleX":1,
            "scaleY":1
         });
         this._C_N_();
      }
      
      public function _1lq(param1:Number, param2:Number) : void
      {
         this._D_f = this.x;
         this._V_1 = this.y;
         var _loc3_:Number = this._0H_m(param1);
         var _loc4_:Number = this._1w3(param2);
         var _loc5_:GTween = new GTween(this,0.5,{
            "x":_loc3_,
            "y":_loc4_
         });
      }
      
      public function saveReturnPotion() : void
      {
         this._D_f = this.x;
         this._V_1 = this.y;
         this._lp = this.returnCenterX();
         this._1P_A_ = this.returnCenterY();
      }
      
      public function doItemReturn() : void
      {
         var _loc1_:GTween = new GTween(this,0.12,{
            "x":this._D_f,
            "y":this._V_1
         });
         this.filters = [this._0W___];
         this.setGlowState(_Q_s);
      }
      
      public function _C_N_() : void
      {
         if(!this.active)
         {
            this._0o5.alpha = 0;
            this._1C_o.alpha = 1;
            this.setAnimation(0,3);
            this.setAnimationDuration(100);
         }
         this.active = true;
      }
      
      public function setActive2() : void
      {
      }
      
      public function setInactive() : void
      {
         if(this.active)
         {
            if(this._0o5 != null)
            {
               this._0o5.alpha = 1;
            }
            if(this._1C_o != null)
            {
               this._1C_o.alpha = 0;
            }
         }
         this.active = false;
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         if(this.active)
         {
            if(this._0o5.alpha < 1 && this._1C_o.alpha > 0)
            {
               this._1C_o.alpha = this._1C_o.alpha - 0.03;
               this._0o5.alpha = this._0o5.alpha + 0.03;
            }
            else
            {
               this._1C_o.alpha = 0;
               this._0o5.alpha = 1;
            }
         }
         else if(this._0o5.alpha > 0 && this._1C_o.alpha < 1)
         {
            this._1C_o.alpha = this._1C_o.alpha + 0.03;
            this._0o5.alpha = this._0o5.alpha - 0.03;
         }
         else
         {
            this._1C_o.alpha = 1;
            this._0o5.alpha = 0;
         }
         if(this._nk == _D_5)
         {
            this._0W___.alpha = this._0W___.alpha - 0.07;
            this.filters = [this._0W___];
            if(this._0W___.alpha <= 0.03)
            {
               this.filters = [];
            }
         }
         else if(this._nk == _Q_s)
         {
            if(this._0W___.alpha >= 0.95 && this._0fI_)
            {
               this._0fI_ = false;
            }
            else if(this._0W___.alpha <= 0.5 && !this._0fI_)
            {
               this._0fI_ = true;
            }
            _loc3_ = !!this._0fI_?1:-1;
            this._0W___.alpha = this._0W___.alpha + 0.01 * _loc3_;
            this.filters = [this._0W___];
         }
         if(this._0aS_)
         {
            _loc4_ = this._wD_(_1tn._0ty,_1tn._0zl);
            if(_loc4_ <= this._dX_)
            {
               if(this._pA_ != _Q_i)
               {
                  this._0G_s();
               }
               this._18O_ = Math.max(_loc4_ / 8,70);
               this._18O_ = Math.min(this._18O_,170);
            }
            else if(this._pA_ != _0V_x)
            {
               this.setAnimationPulse();
            }
         }
         if(this._0J_N_)
         {
            this.setXPos(this._lp + (Math.random() * 6 - 3));
            this.setYPos(this._1P_A_ + (Math.random() * 6 - 3));
            this._0S_8++;
            if(this._0S_8 == _0hI_)
            {
               this._0J_N_ = false;
               this._0S_8 = 0;
            }
         }
         this._1G_l(param1,param2);
      }
      
      public function setShake(param1:Boolean) : void
      {
         this._0J_N_ = param1;
      }
      
      public function _1G_l(param1:int, param2:int) : void
      {
         if(this.active)
         {
            removeChild(this._0o5);
            this._Q_F_ = this._Q_F_ + param2;
            if(this._Q_F_ > this._18O_)
            {
               this._1R_R_ = (this._1R_R_ + 1) % this._1__A_;
               this._Q_F_ = 0;
            }
            else if(this._1R_R_ > this._1__A_)
            {
               this._1R_R_ = 0;
            }
            this._0o5 = this._1mf[this._1G_6 + this._1R_R_];
            if(this._pA_ == _1L_E_)
            {
               if(this.scaleX > 0.01)
               {
                  this.scaleX = this.scaleX - param2 * 0.002;
                  this.scaleY = this.scaleY - param2 * 0.002;
                  this.setXPos(this._lp + Math.random() * 5);
                  this.setYPos(this._1P_A_ + Math.random() * 5);
               }
               else
               {
                  this.scaleX = 0.01;
                  this.scaleY = 0.01;
               }
            }
            addChild(this._0o5);
         }
      }
      
      public function setAnimationDuration(param1:Number) : void
      {
         this._18O_ = param1;
      }
      
      public function onMouseOver(param1:MouseEvent) : void
      {
         Mouse.cursor = "hand";
      }
      
      private function _0W_X_(param1:MouseEvent) : void
      {
         Mouse.cursor = "auto";
      }
      
      public function setMouseTracking(param1:Boolean) : void
      {
         this._0aS_ = param1;
      }
      
      private function _wD_(param1:Number, param2:Number) : Number
      {
         return (this.getCenterX() - param1) * (this.getCenterX() - param1) + (this.getCenterY() - param2) * (this.getCenterY() - param2);
      }
      
      public function reset() : void
      {
         this.active = false;
         this._18O_ = 50;
         this._0aS_ = false;
      }
      
      public function setAnimation(param1:Number, param2:Number) : void
      {
         this._1G_6 = param1;
         this._1R_R_ = 0;
         this._Q_F_ = 0;
         this._1__A_ = param2;
         this._pA_ = -1;
      }
      
      public function setAnimationPulse() : void
      {
         this.setAnimation(0,3);
         this._18O_ = 250;
         this._pA_ = _0V_x;
      }
      
      public function _0G_s() : void
      {
         this.setAnimation(20,13);
         this._pA_ = _Q_i;
      }
      
      public function setAnimationClicked() : void
      {
         this.setAnimation(3,3);
         this._18O_ = 20;
         this._pA_ = _1L_E_;
         this.setMouseTracking(false);
      }
      
      public function resetVars() : void
      {
         this.active = false;
         this._1R_R_ = 0;
         this._pA_ = -1;
         this._18O_ = 50;
         this._0aS_ = false;
         this._Q_F_ = 0;
         this._1G_6 = 0;
         this.scaleX = 1;
         this.scaleY = 1;
      }
   }
}
