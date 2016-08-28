package _0l7
{
   import _1ar.Command;
   import _3b.DialogSignal;
   import Packets._mz;
   import _wi.Injector;
   import _0mi.EvolveDialog;
   
   public class _1ez extends Command
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0jW_:_mz;
      
      [Inject]
      public var _T_X_:Injector;
      
      public function _1ez()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:EvolveDialog = this._T_X_.getInstance(EvolveDialog);
         this._06Z_.dispatch(_loc1_);
         _loc1_._1Y_d._03f(this._0jW_);
      }
   }
}
