package _1k1
{
   import _P_S_.Mediator;
   import _lE_._0X_y;
   
   public class _0mq extends Mediator
   {
       
      
      [Inject]
      public var view:_1k1.ReskinPanel;
      
      [Inject]
      public var _0__o:_0X_y;
      
      public function _0mq()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.reskin.add(this._tI_);
      }
      
      override public function destroy() : void
      {
         this.view.reskin.remove(this._tI_);
      }
      
      private function _tI_() : void
      {
         this._0__o.dispatch();
      }
   }
}
