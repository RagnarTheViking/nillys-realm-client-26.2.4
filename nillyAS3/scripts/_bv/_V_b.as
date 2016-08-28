package _bv
{
   import _P_S_.Mediator;
   import _1E_7._7p;
   import _1C_p.News;
   import _1C_p._16E_;
   
   public class _V_b extends Mediator
   {
       
      
      [Inject]
      public var view:_bv._1gT_;
      
      [Inject]
      public var update:_7p;
      
      [Inject]
      public var model:News;
      
      public function _V_b()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.update(this.model.news);
         this.update.add(this._x7);
      }
      
      override public function destroy() : void
      {
         this.update.remove(this._x7);
      }
      
      private function _x7(param1:Vector.<_16E_>) : void
      {
         this.view.update(param1);
      }
   }
}
