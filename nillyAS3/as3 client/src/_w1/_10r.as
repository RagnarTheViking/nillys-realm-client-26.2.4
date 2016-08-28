package _w1
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   import _1ud._1Q_Y_;
   import _04e._05X_;
   import Packets.Server.Death;
   import flash.display.BitmapData;
   
   public class _10r extends Mediator
   {
       
      
      [Inject]
      public var view:_w1.ZombifyDialog;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _0P_Y_:_1Q_Y_;
      
      [Inject]
      public var death:_05X_;
      
      public function _10r()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.closed.addOnce(this._qN_);
      }
      
      private function _qN_() : void
      {
         var _loc1_:Death = null;
         _loc1_ = this.death._1sw();
         var _loc2_:BitmapData = new _1wr(this.view.stage.width,this.view.stage.height);
         _loc2_.draw(this.view.stage);
         _loc1_.background = _loc2_;
         this.closeDialogs.dispatch();
         this._0P_Y_.dispatch(_loc1_);
      }
   }
}
