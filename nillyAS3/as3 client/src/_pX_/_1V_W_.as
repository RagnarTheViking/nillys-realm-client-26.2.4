package _pX_
{
   import _4u.Account;
   import _1T_4._kc;
   import _1T_4._1U_z;
   import _v4._1K_N_;
   import _1y1._I_Y_;
   import _1F_z._0P_4;
   import _0pN_._049;
   import flash.display.Sprite;
   import _ia.FameView;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   
   public class _1V_W_
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _11v:_kc;
      
      [Inject]
      public var _0rh:_1U_z;
      
      [Inject]
      public var _1h:_1K_N_;
      
      [Inject]
      public var _0v9:_I_Y_;
      
      [Inject]
      public var _0xI_:_0P_4;
      
      public function _1V_W_()
      {
         super();
      }
      
      public function execute() : void
      {
         this.account.clear();
         this._11v.dispatch();
         this._0xI_._11i();
         this._0v9._0P_3.addOnce(this._5x);
         this._0v9.start();
      }
      
      private function _5x(param1:_049, param2:Boolean, param3:String) : void
      {
         this._0rh.dispatch(this._19__());
      }
      
      private function _19__() : Sprite
      {
         if(this._1h._1Z_z() == FameView)
         {
            return new CharacterSelectionAndNewsScreen();
         }
         return new (this._1h._1Z_z() || CharacterSelectionAndNewsScreen)();
      }
   }
}
