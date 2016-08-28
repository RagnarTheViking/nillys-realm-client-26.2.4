package _05g
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   import _m2._27;
   import _v4.Client;
   
   public class _1kB_ extends Mediator
   {
       
      
      [Inject]
      public var view:_05g.CharacterSlotNeedGoldDialog;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _1sl:_27;
      
      [Inject]
      public var model:Client;
      
      public function _1kB_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._1S_H_.add(this._0T_6);
         this.view.cancel.add(this.onCancel);
         this.view.setPrice(this.model.getNextCharSlotPrice());
      }
      
      override public function destroy() : void
      {
         this.view._1S_H_.remove(this._0T_6);
         this.view.cancel.remove(this.onCancel);
      }
      
      public function onCancel() : void
      {
         this._0dR_.dispatch();
      }
      
      public function _0T_6() : void
      {
         this._1sl.dispatch();
      }
   }
}
