package _0pn
{
   import _P_S_.Command;
   import _3b.DialogSignal;
   import _1y1._al;
   import _166.Package;
   import _0C_j.PackageOfferDialog;
   
   public class _0Y_Q_ extends Command
   {
       
      
      [Inject]
      public var _0K_A_:DialogSignal;
      
      [Inject]
      public var _F_D_:_al;
      
      [Inject]
      public var packageId:int;
      
      [Inject]
      public var _0E_w:_0pn._05b;
      
      public function _0Y_Q_()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:Package = null;
         if(this._F_D_._1kN_(this.packageId))
         {
            _loc1_ = this._F_D_._1gl(this.packageId);
            this._0K_A_.dispatch(new PackageOfferDialog().setPackage(_loc1_));
         }
         else
         {
            this._0E_w.dispatch();
         }
      }
   }
}
