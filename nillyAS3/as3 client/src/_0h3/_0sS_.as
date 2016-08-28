package _0h3
{
   import _P_S_.Mediator;
   import _0E_n._jE_;
   import _03U_._51;
   import _1R_m._1H_h;
   import _1T_4._0es;
   import _05g.TitleView;
   
   public class _0sS_ extends Mediator
   {
       
      
      [Inject]
      public var _H_u:_jE_;
      
      [Inject]
      public var _jk:_51;
      
      [Inject]
      public var _03M_:_1H_h;
      
      [Inject]
      public var view:_0h3._4i;
      
      [Inject]
      public var _kU_:_0es;
      
      public function _0sS_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._0W_O_(this._jk._1uW_());
         this.view.setSelected(this._jk._4__(this._jk._lP_()));
         this.view._fX_.add(this._b8);
         this.view.back.add(this._1O_U_);
      }
      
      override public function destroy() : void
      {
         this.view._fX_.remove(this._b8);
         this.view.back.remove(this._1O_U_);
      }
      
      private function _1O_U_() : void
      {
         this._kU_.dispatch(new TitleView());
      }
      
      private function _b8(param1:String) : void
      {
         this._03M_.dispatch(this._jk._P_t(param1));
      }
   }
}
