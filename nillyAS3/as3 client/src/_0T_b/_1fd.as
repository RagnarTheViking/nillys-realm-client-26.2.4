package _0T_b
{
   import flash.display.Sprite;
   import _0J_8._0C_M_;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _W_Q_.TextButton;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import flash.display.DisplayObject;
   import _1xa.SText;
   
   public class _1fd extends Sprite implements _0C_M_
   {
      
      private static const _Z_B_:int = 18;
       
      
      private var _O_u:Signal;
      
      private var _07U_:Signal;
      
      private var userName:String = "";
      
      private var _09g:Boolean;
      
      private var _T_M_:SimpleText;
      
      private var _0S_7:TextButton;
      
      private var _1K_d:TextButton;
      
      private var ign:String = "";
      
      public function _1fd(param1:String)
      {
         super();
         this._1F_Q_();
         this._1tc();
         this.ign = param1;
      }
      
      public function get login() : Signal
      {
         return this._O_u;
      }
      
      public function get register() : Signal
      {
         return this._07U_;
      }
      
      private function _1F_Q_() : void
      {
         this._continue();
         this._S_N_();
         this._1by();
      }
      
      private function _1tc() : void
      {
         this._O_u = new NativeMappedSignal(this._1K_d,MouseEvent.CLICK);
         this._07U_ = new NativeMappedSignal(this._0S_7,MouseEvent.CLICK);
      }
      
      private function _continue() : void
      {
         this._T_M_ = this._7u();
         this._T_M_.setStringBuilder(new _dU_().setParams(_1O_I_._0P_i));
      }
      
      private function _7u() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText();
         _loc1_.setAutoSize(TextFieldAutoSize.RIGHT);
         _loc1_.setSize(_Z_B_).setColor(11776947);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         return _loc1_;
      }
      
      private function _S_N_() : void
      {
         this._1K_d = new TextButton(_1O_I_._X_b,_Z_B_,false);
         this._1K_d.setAutoSize(TextFieldAutoSize.RIGHT);
      }
      
      private function _1by() : void
      {
         this._0S_7 = new TextButton(_1O_I_._12X_,_Z_B_,false);
         this._0S_7.setAutoSize(TextFieldAutoSize.RIGHT);
      }
      
      private function _0yX_() : DisplayObject
      {
         var _loc1_:SimpleText = new SimpleText();
         _loc1_.setColor(11776947).setAutoSize(TextFieldAutoSize.RIGHT).setSize(_Z_B_);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         _loc1_.setStringBuilder(new SText(" - "));
         return _loc1_;
      }
      
      public function _G_z(param1:String, param2:Boolean) : void
      {
         this.userName = param1;
         this._09g = param2;
         this._dA_();
      }
      
      private function _dA_() : void
      {
         this._07();
         if(this._09g)
         {
            this._1C_R_();
         }
         else
         {
            this._0R_I_();
         }
      }
      
      private function _07() : void
      {
         while(numChildren)
         {
            removeChildAt(0);
         }
      }
      
      private function _1C_R_() : void
      {
         this._T_M_.setStringBuilder(new _dU_().setParams(_1O_I_._0S_B_,{"userName":this.ign}));
         this._1K_d._1nb(_1O_I_._0q8);
         this._h1(this._T_M_,this._1K_d);
      }
      
      private function _0R_I_() : void
      {
         this._T_M_.setStringBuilder(new _dU_().setParams(_1O_I_._0P_i,{"userName":this.ign}));
         this._1K_d._1nb(_1O_I_._X_b);
         this._h1(this._T_M_,this._0yX_(),this._0S_7,this._0yX_(),this._1K_d);
      }
      
      private function _h1(... rest) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         for each(_loc2_ in rest)
         {
            addChild(_loc2_);
         }
         _loc3_ = 0;
         _loc4_ = rest.length;
         while(_loc4_--)
         {
            _loc5_ = rest[_loc4_];
            _loc5_.x = _loc3_;
            _loc3_ = _loc3_ - _loc5_.width;
         }
      }
   }
}
