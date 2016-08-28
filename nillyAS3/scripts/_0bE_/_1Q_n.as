package _0bE_
{
   import flash.events.MouseEvent;
   import ToolTips._1D_l;
   import _Y_M_.Menu;
   import com.company.assembleegameclient.objects.Player;
   import _Y_M_._02U_;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class _1Q_n extends _1Y_
   {
       
      
      public function _1Q_n()
      {
         super(16777215,4179794,false);
      }
      
      override protected function onMouseOver(param1:MouseEvent) : void
      {
         super.onMouseOver(param1);
         _0kI_(new _1D_l(this._1I_n(),false));
      }
      
      override protected function onMouseOut(param1:MouseEvent) : void
      {
         super.onMouseOut(param1);
         _0kI_(null);
      }
      
      override protected function onMouseDown(param1:MouseEvent) : void
      {
         super.onMouseDown(param1);
         _4q();
         _24(this._0D_r());
      }
      
      protected function _0D_r() : Menu
      {
         var _loc1_:Player = go_ as Player;
         if(_loc1_ == null || _loc1_.map_ == null)
         {
            return null;
         }
         var _loc2_:Player = _loc1_.map_.player_;
         if(_loc2_ == null)
         {
            return null;
         }
         return new _02U_(_loc1_.map_,this._1I_n());
      }
      
      private function _1I_n() : Vector.<Player>
      {
         var _loc1_:GameObject = null;
         var _loc2_:Vector.<Player> = new <Player>[go_ as Player];
         for each(_loc1_ in _3P_)
         {
            _loc2_.push(_loc1_ as Player);
         }
         return _loc2_;
      }
   }
}
