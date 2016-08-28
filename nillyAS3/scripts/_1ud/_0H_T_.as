package _1ud
{
   import _v4.Client;
   import _04e._05X_;
   import _1T_4._0es;
   import _1__8._19A_;
   import _w1.ResurrectionView;
   
   public class _0H_T_
   {
       
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var _0pS_:_05X_;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var _0G_2:_19A_;
      
      public function _0H_T_()
      {
         super();
      }
      
      public function execute() : void
      {
         this._0G_2.info("Resurrect Player");
         this._0pS_._I_V_();
         this.model._7O_(true);
         this._kU_.dispatch(new ResurrectionView());
      }
   }
}
