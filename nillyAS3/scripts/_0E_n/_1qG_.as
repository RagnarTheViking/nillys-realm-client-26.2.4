package _0E_n
{
   import _P_S_.Mediator;
   import _1T_4._0es;
   import _v4._1K_N_;
   import _1T_4._1S_b;
   import flash.display.Sprite;
   
   public class _1qG_ extends Mediator
   {
       
      
      [Inject]
      public var view:_0E_n._1X_U_;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var model:_1K_N_;
      
      [Inject]
      public var _mR_:_1S_b;
      
      public function _1qG_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._kU_.add(this._1pE_);
         this._mR_.add(this._02N_);
      }
      
      override public function destroy() : void
      {
         this._kU_.remove(this._1pE_);
         this._mR_.add(this._02N_);
      }
      
      private function _1pE_(param1:Sprite) : void
      {
         this.model._0oa(Object(param1).constructor as Class);
         this.view._kU_(param1);
      }
      
      private function _02N_() : void
      {
         this.view._kU_(this.view._0yY_());
      }
   }
}
