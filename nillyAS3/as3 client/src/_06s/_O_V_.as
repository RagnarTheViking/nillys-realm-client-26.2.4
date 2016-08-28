package _06s
{
   import _0Q_Q_._1oj;
   import _0Q_Q_._v__;
   import _1T_4._0es;
   import _ia.FameView;
   
   public class _O_V_
   {
       
      
      [Inject]
      public var _W_d:_1oj;
      
      [Inject]
      public var model:_v__;
      
      [Inject]
      public var _kU_:_0es;
      
      public function _O_V_()
      {
         super();
      }
      
      public function execute() : void
      {
         this.model.accountId = this._W_d._1K_k();
         this.model._1lf = this._W_d._1N_R_();
         this._kU_.dispatch(new FameView());
      }
   }
}
