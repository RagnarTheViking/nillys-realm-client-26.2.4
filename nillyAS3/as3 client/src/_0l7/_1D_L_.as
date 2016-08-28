package _0l7
{
   import _1ar.Command;
   import _3b.DialogSignal;
   import _1F_z._19s;
   import _P_N_.NewAbility;
   
   public class _1D_L_ extends Command
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0i__:_19s;
      
      [Inject]
      public var _L_f:int;
      
      public function _1D_L_()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:NewAbility = new NewAbility(this._0i__._0__5(this._L_f));
         this._06Z_.dispatch(_loc1_);
      }
   }
}
