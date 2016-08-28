package _A_4
{
   import _P_S_.Mediator;
   import _0E_T_._1zi;
   import _0E_T_._0ih;
   import flash.display.DisplayObject;
   
   public class _ay extends Mediator
   {
       
      
      [Inject]
      public var view:_A_4._zp;
      
      [Inject]
      public var model:_1zi;
      
      [Inject]
      public var factory:_A_4._1r;
      
      public function _ay()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.model.selected.add(this._1um);
         this._1um(this.model._1H_j());
      }
      
      override public function destroy() : void
      {
         this.model.selected.remove(this._1um);
      }
      
      private function _1um(param1:_0ih) : void
      {
         var _loc2_:Vector.<DisplayObject> = this.factory.make(param1._E_G_);
         this.view.setItems(_loc2_);
      }
   }
}
