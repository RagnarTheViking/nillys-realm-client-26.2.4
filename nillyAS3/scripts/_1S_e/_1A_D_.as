package _1S_e
{
   import _P_S_.Mediator;
   import _v4.Client;
   import _m2._27;
   
   public class _1A_D_ extends Mediator
   {
       
      
      [Inject]
      public var view:_1S_e.CurrencyDisplay;
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var _1sl:_27;
      
      public function _1A_D_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.model.creditsSig.add(this._hR_);
         this.model.fameSig.add(this._3n);
         this.model.tokenSig.add(this._1D_T_);
         this.view._0mc.add(this._1C_V_);
      }
      
      override public function destroy() : void
      {
         this.model.creditsSig.remove(this._hR_);
         this.model.fameSig.remove(this._3n);
         this.view._0mc.remove(this._1C_V_);
      }
      
      private function _hR_(param1:int) : void
      {
         this.view.draw(param1,this.model.getFame());
      }
      
      private function _3n(param1:int) : void
      {
         this.view.draw(this.model.getCredits(),param1);
      }
      
      private function _1D_T_(param1:int) : void
      {
         this.view.draw(this.model.getCredits(),this.model.getFame(),param1);
      }
      
      private function _1C_V_() : void
      {
         this._1sl.dispatch();
      }
   }
}
