package _0C_2
{
   import _0pN_._049;
   import _0R_R_._1Q_g;
   import _0u4._0us;
   import _4u.Account;
   import _0pN_._1nd;
   
   public class _08C_ extends _049
   {
       
      
      [Inject]
      public var login:_1Q_g;
      
      [Inject]
      public var _1iN_:_0us;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var local:_0C_2._17f;
      
      public function _08C_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         if(this._1iN_.isGuest())
         {
            this._O___();
         }
         else
         {
            this._10u();
         }
      }
      
      private function _10u() : void
      {
         this.login._0P_3.addOnce(this._1xz);
         this.login.start();
      }
      
      private function _1xz(param1:_1nd, param2:Boolean, param3:String = "") : void
      {
         _0et(true);
      }
      
      private function _O___() : void
      {
         this.account._0cX_(this.local._G_Y_(),"");
         _0et(true);
      }
   }
}
