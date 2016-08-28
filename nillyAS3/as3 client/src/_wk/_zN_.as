package _wk
{
   import _P_S_.Mediator;
   import _1gF_._1n;
   import _C_._0C_J_;
   import _C_._Q_E_;
   
   public class _zN_ extends Mediator
   {
       
      
      [Inject]
      public var _np:_1n;
      
      [Inject]
      public var _nJ_:_0C_J_;
      
      [Inject]
      public var _1__p:_Q_E_;
      
      public function _zN_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._np._J_(this._nJ_._7X_());
         this._np._7D_(this._1__p._17P_());
         this._np._0L_b(this._1__p._1s9());
      }
   }
}
