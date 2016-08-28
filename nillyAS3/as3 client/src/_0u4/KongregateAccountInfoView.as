package _0u4
{
   import flash.display.Sprite;
   import _0J_8._0C_M_;
   import _C_._1O_I_;
   import _1S_0.NativeMappedSignal;
   import _1gF_.SimpleText;
   import _W_Q_.TextButton;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import flash.events.MouseEvent;
   import _f7.Signal;
   import _1xa._dU_;
   import flash.display.DisplayObject;
   
   public class KongregateAccountInfoView extends Sprite implements _0C_M_
   {
      
      private static const _12X_:String = _1O_I_._0rH_;
      
      private static const _Z_B_:int = 18;
       
      
      private var _07U_:NativeMappedSignal;
      
      private var _T_M_:SimpleText;
      
      private var _0S_7:TextButton;
      
      private var userName:String = "";
      
      private var _09g:Boolean;
      
      public function KongregateAccountInfoView()
      {
         super();
         this._continue();
         this._R_R_();
      }
      
      private function _continue() : void
      {
         this._T_M_ = new SimpleText().setSize(_Z_B_).setColor(11776947);
         this._T_M_.setAutoSize(TextFieldAutoSize.RIGHT);
         this._T_M_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         addChild(this._T_M_);
      }
      
      private function _R_R_() : void
      {
         this._0S_7 = new TextButton(_12X_,_Z_B_,false);
         this._0S_7.setAutoSize(TextFieldAutoSize.RIGHT);
         this._07U_ = new NativeMappedSignal(this._0S_7,MouseEvent.CLICK);
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
            this._M_p();
         }
         else
         {
            this._0ua();
         }
      }
      
      private function _07() : void
      {
         while(numChildren)
         {
            removeChildAt(0);
         }
      }
      
      public function get register() : Signal
      {
         return this._07U_;
      }
      
      private function _M_p() : void
      {
         this._T_M_.setStringBuilder(new _dU_().setParams(_1O_I_._0k1,{"userName":this.userName}));
         this._0eT_(this._T_M_);
      }
      
      private function _0ua() : void
      {
         this._T_M_.setStringBuilder(new _dU_().setParams(_1O_I_._1T_Z_));
         this._0eT_(this._T_M_,this._0S_7);
         this._T_M_.x = this._0S_7.getBounds(this).left;
      }
      
      private function _0eT_(... rest) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:int = rest.length;
         while(_loc3_--)
         {
            _loc2_ = rest[_loc3_];
            addChild(_loc2_);
         }
      }
   }
}
