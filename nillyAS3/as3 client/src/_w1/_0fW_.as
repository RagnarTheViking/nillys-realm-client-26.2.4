package _w1
{
   import _P_S_.Mediator;
   import com.company.assembleegameclient.game.GameSprite;
   import _1ud._08e;
   import _0jo._hO_;
   import Packets.Server.Death;
   import com.company.assembleegameclient.objects.Player;
   import flash.utils.Dictionary;
   
   public class _0fW_ extends Mediator
   {
       
      
      [Inject]
      public var view:GameSprite;
      
      [Inject]
      public var _0J_t:_08e;
      
      [Inject]
      public var _1R_c:_hO_;
      
      public function _0fW_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._0J_t.add(this._M_B_);
      }
      
      override public function destroy() : void
      {
         this._0J_t.remove(this._M_B_);
      }
      
      private function _M_B_(param1:Death) : void
      {
         this._m4();
         this._05x(param1);
         this._1R_c.dispatch(false);
      }
      
      private function _m4() : void
      {
         var _loc1_:Player = this.view.map.player_;
         _loc1_ && this.view.map.removeObj(_loc1_.objectId_);
         this.view.map.player_ = null;
      }
      
      private function _05x(param1:Death) : void
      {
         var _loc2_:Dictionary = this.view.map.goDict_;
         _loc2_ && this.view.setFocus(_loc2_[param1._0vo]);
      }
   }
}
