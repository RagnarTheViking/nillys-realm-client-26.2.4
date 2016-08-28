package _bv
{
   import _0J_8._167;
   import flash.geom.ColorTransform;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import _0H_6.GameContext;
   import _S_b._O_e;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1C_p.News;
   import _1gF_.SimpleText;
   import _1xa.SText;
   import _1xa._dU_;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.text.TextField;
   import flash.display.Sprite;
   import _C_._0C_J_;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import _ll.SFX;
   import flash.display.DisplayObject;
   import _17B_._1dh;
   import com.company.util.Keys;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import com.company.util.MoreColorUtil;
   
   public class _19k extends _167
   {
      
      public static const _0W_P_:int = 440;
      
      public static const _0kV_:int = 400;
      
      private static const _0U_V_:ColorTransform = new ColorTransform(1,220 / 255,133 / 255);
      
      private static const _U_N_:DropShadowFilter = new DropShadowFilter(0,0,0);
      
      private static const GLOW_FILTER:GlowFilter = new GlowFilter(16711680,1,11,5);
      
      private static const _1K_0:Array = [_U_N_,GLOW_FILTER];
      
      private static const _16L_:Array = [_U_N_];
      
      public static var _1bx:Class = _J_I_;
      
      public static var _gu:Class = _7M_;
      
      public static var _q9:int = _0W_P_;
      
      public static var _P_m:int = _0kV_;
       
      
      private var _nh:_bv._X_r;
      
      private var _1iV_:int = -1;
      
      private var _0wk:TextField;
      
      private var _0ky:TextField;
      
      private var _v:TextField;
      
      private var _0S_4:TextField;
      
      private var _0Z_A_:Vector.<TextField>;
      
      private var _N_f:Sprite;
      
      private var _M_H_:Sprite;
      
      public function _19k(param1:int = 1)
      {
         _q9 = _0W_P_;
         _P_m = _0kV_;
         super(_q9,_P_m);
         this._ml(true);
         this._hB_();
         this._lx(param1);
         WebMain.stage_.addEventListener(KeyboardEvent.KEY_DOWN,this._1V_I_);
         addEventListener(Event.REMOVED_FROM_STAGE,this.destroy);
      }
      
      public static function _11Q_() : void
      {
         var _loc1_:_O_e = GameContext.getInjector().getInstance(_O_e);
         if(_loc1_ != null && _loc1_._14O_ != null)
         {
            _loc1_._14O_._Q_S_();
         }
      }
      
      public static function _1wT_() : Boolean
      {
         var _loc1_:int = 1;
         while(_loc1_ <= News._1T_e)
         {
            if(Parameters.data_["hasNewsUpdate" + _loc1_] != null && Parameters.data_["hasNewsUpdate" + _loc1_] == true)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public static function _1g8(param1:String, param2:int, param3:int, param4:Boolean) : SimpleText
      {
         var _loc5_:SimpleText = null;
         _loc5_ = new SimpleText().setSize(18).setColor(16777215).setTextWidth(_q9 - _1Y_6 * 2);
         _loc5_.setBold(true);
         if(param4)
         {
            _loc5_.setStringBuilder(new SText(param1));
         }
         else
         {
            _loc5_.setStringBuilder(new _dU_().setParams(param1));
         }
         _loc5_.setWordWrap(true);
         _loc5_.setMultiLine(true);
         _loc5_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc5_.setHorizontalAlign(TextFormatAlign.CENTER);
         _loc5_.filters = [new DropShadowFilter(0,0,0)];
         _loc5_.x = param2;
         _loc5_.y = param3;
         return _loc5_;
      }
      
      private function _hB_() : void
      {
         var _loc1_:TextField = null;
         var _loc2_:int = News._1T_e;
         this._0Z_A_ = new Vector.<TextField>(_loc2_,true);
         this._0wk = new TextField();
         this._0ky = new TextField();
         this._v = new TextField();
         this._0S_4 = new TextField();
         this._0Z_A_[0] = this._0wk;
         this._0Z_A_[1] = this._0ky;
         this._0Z_A_[2] = this._v;
         this._0Z_A_[3] = this._0S_4;
         var _loc3_:_0C_J_ = GameContext.getInjector().getInstance(_0C_J_);
         var _loc4_:int = 1;
         for each(_loc1_ in this._0Z_A_)
         {
            _loc3_.apply(_loc1_,20,16777215,true);
            _loc1_.filters = _16L_;
            if(_loc4_ > 0 && _loc4_ <= News._1T_e)
            {
               _loc1_.text = "  " + _loc4_ + "  ";
               _loc1_.width = _loc1_.textWidth;
               _loc1_.x = _q9 * (_loc4_ + 3) / 11 - _loc1_.textWidth / 2;
               _loc1_.addEventListener(MouseEvent.ROLL_OVER,this._07K_);
               _loc1_.addEventListener(MouseEvent.ROLL_OUT,this._1gn);
            }
            _loc1_.height = _loc1_.textHeight;
            _loc1_.y = _P_m - 33;
            _loc1_.selectable = false;
            _loc1_.addEventListener(MouseEvent.CLICK,this._1k9);
            addChild(_loc1_);
            _loc4_++;
         }
         this._N_f = this._1J_9();
         this._M_H_ = this._0pF_();
         this._N_f.x = _q9 * 3 / 11 - this._M_H_.width / 2;
         this._N_f.y = _P_m - 4;
         addChild(this._N_f);
         this._M_H_.x = _q9 * 8 / 11 - this._M_H_.width / 2;
         this._M_H_.y = _P_m - 4;
         addChild(this._M_H_);
      }
      
      public function _07K_(param1:MouseEvent) : void
      {
         var _loc2_:TextField = param1.currentTarget as TextField;
         _loc2_.textColor = 16701832;
      }
      
      public function _1gn(param1:MouseEvent) : void
      {
         var _loc2_:TextField = param1.currentTarget as TextField;
         _loc2_.textColor = 16777215;
      }
      
      public function _1k9(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._M_H_:
               if(this._1iV_ + 1 <= News._1T_e)
               {
                  this._lx(this._1iV_ + 1);
               }
               return;
            case this._N_f:
               if(this._1iV_ - 1 >= 1)
               {
                  this._lx(this._1iV_ - 1);
               }
               return;
            case this._0wk:
               this._lx(1);
               return;
            case this._0ky:
               this._lx(2);
               return;
            case this._v:
               this._lx(3);
               return;
            case this._0S_4:
               this._lx(4);
               return;
            default:
               return;
         }
      }
      
      private function _0j__(param1:int) : TextField
      {
         if(param1 >= 0 < News._1T_e)
         {
            return this._0Z_A_[param1 - 1];
         }
         return null;
      }
      
      private function destroy(param1:Event) : void
      {
         var _loc2_:TextField = null;
         WebMain.stage_.removeEventListener(KeyboardEvent.KEY_DOWN,this._1V_I_);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.destroy);
         if(this._0Z_A_ != null)
         {
            for each(_loc2_ in this._0Z_A_)
            {
               _loc2_.removeEventListener(MouseEvent.CLICK,this._1k9);
               _loc2_.removeEventListener(MouseEvent.ROLL_OVER,this._07K_);
               _loc2_.removeEventListener(MouseEvent.ROLL_OUT,this._1gn);
            }
         }
         this._N_f.removeEventListener(MouseEvent.CLICK,this._1k9);
         this._N_f.removeEventListener(MouseEvent.MOUSE_OVER,this._0__p);
         this._N_f.removeEventListener(MouseEvent.MOUSE_OUT,this._0hw);
         this._M_H_.removeEventListener(MouseEvent.CLICK,this._1k9);
         this._M_H_.removeEventListener(MouseEvent.MOUSE_OVER,this._0__p);
         this._M_H_.removeEventListener(MouseEvent.MOUSE_OUT,this._0hw);
      }
      
      private function _lx(param1:int) : void
      {
         var _loc2_:TextField = null;
         var _loc3_:Boolean = _1wT_();
         if(param1 < 1 || param1 > News._1T_e)
         {
            return;
         }
         if(this._1iV_ != -1)
         {
            removeChild(this._nh);
            _loc2_ = this._0j__(this._1iV_);
            if(_loc2_ != null)
            {
               _loc2_.filters = _16L_;
            }
            SFX.play("button_click");
         }
         this._1iV_ = param1;
         var _loc4_:News = GameContext.getInjector().getInstance(News);
         this._nh = _loc4_._1qO_(param1);
         addChild(this._nh);
         _loc2_ = this._0j__(this._1iV_);
         if(_loc2_ != null)
         {
            _loc2_.filters = _1K_0;
         }
         Parameters.data_["hasNewsUpdate" + param1] = false;
         var _loc5_:Boolean = _1wT_();
         if(_loc3_ != _loc5_)
         {
            _11Q_();
         }
      }
      
      override protected function makeModalBackground() : Sprite
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:Sprite = new Sprite();
         var _loc3_:DisplayObject = new _1bx();
         _loc3_.width = _q9 + 1;
         _loc3_.height = _P_m - 25;
         _loc3_.y = 27;
         _loc3_.alpha = 0.95;
         _loc1_ = new _gu();
         _loc1_.width = _q9 + 1;
         _loc1_.height = _P_m - 67;
         _loc1_.y = 27;
         _loc1_.alpha = 1;
         var _loc4_:_1dh = new _1dh();
         _loc4_.draw(_q9,_P_m,_1dh._1rP_);
         _loc2_.addChild(_loc3_);
         _loc2_.addChild(_loc1_);
         _loc2_.addChild(_loc4_);
         return _loc2_;
      }
      
      private function _1V_I_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keys.RIGHT)
         {
            if(this._1iV_ + 1 <= News._1T_e)
            {
               this._lx(this._1iV_ + 1);
            }
         }
         else if(param1.keyCode == Keys.LEFT)
         {
            if(this._1iV_ - 1 >= 1)
            {
               this._lx(this._1iV_ - 1);
            }
         }
      }
      
      private function _1J_9() : Sprite
      {
         var _loc1_:BitmapData = TextureLibrary.getBitmap("lofiInterface",54);
         var _loc2_:Bitmap = new Bitmap(_loc1_);
         _loc2_.scaleX = 4;
         _loc2_.scaleY = 4;
         _loc2_.rotation = -90;
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(_loc2_);
         _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this._0__p);
         _loc3_.addEventListener(MouseEvent.MOUSE_OUT,this._0hw);
         _loc3_.addEventListener(MouseEvent.CLICK,this._1k9);
         return _loc3_;
      }
      
      private function _0pF_() : Sprite
      {
         var _loc1_:BitmapData = TextureLibrary.getBitmap("lofiInterface",55);
         var _loc2_:Bitmap = new Bitmap(_loc1_);
         _loc2_.scaleX = 4;
         _loc2_.scaleY = 4;
         _loc2_.rotation = -90;
         var _loc3_:Sprite = new Sprite();
         _loc3_.addChild(_loc2_);
         _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this._0__p);
         _loc3_.addEventListener(MouseEvent.MOUSE_OUT,this._0hw);
         _loc3_.addEventListener(MouseEvent.CLICK,this._1k9);
         return _loc3_;
      }
      
      private function _0__p(param1:MouseEvent) : void
      {
         param1.currentTarget.transform.colorTransform = _0U_V_;
      }
      
      private function _0hw(param1:MouseEvent) : void
      {
         param1.currentTarget.transform.colorTransform = MoreColorUtil.identity;
      }
      
      override public function onCloseClick(param1:MouseEvent) : void
      {
         SFX.play("button_click");
      }
   }
}
