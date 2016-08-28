package _05g
{
   import _P_S_.Mediator;
   import _W_Q_._S_2;
   import _0hJ_._Z___;
   import _1T_4._0es;
   
   public class _1Z_Q_ extends Mediator
   {
       
      
      [Inject]
      public var view:_S_2;
      
      [Inject]
      public var servers:_Z___;
      
      [Inject]
      public var _kU_:_0es;
      
      public function _1Z_Q_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._0Q_d.add(this._1qS_);
         this.view.initialize(this.servers._1Q_t());
      }
      
      override public function destroy() : void
      {
         this.view._0Q_d.remove(this._1qS_);
      }
      
      private function _1qS_() : void
      {
         this._kU_.dispatch(new TitleView());
      }
   }
}
