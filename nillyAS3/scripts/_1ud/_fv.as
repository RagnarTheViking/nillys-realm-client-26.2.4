package _1ud
{
   import _3b.DialogSignal;
   import _3b._jq;
   import _1__8._19A_;
   import _w1.ZombifyDialog;
   
   public class _fv
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _1X_w:_jq;
      
      [Inject]
      public var _0G_2:_19A_;
      
      public function _fv()
      {
         super();
      }
      
      public function execute() : void
      {
         this._0G_2.info("Zombify Player");
         this._06Z_.dispatch(new ZombifyDialog());
         this._1X_w.dispatch(13056);
      }
   }
}
