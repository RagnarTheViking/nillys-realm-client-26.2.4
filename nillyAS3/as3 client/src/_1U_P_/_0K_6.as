package _1U_P_
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import _T_n._14v;
   import _04h._083;
   import _1un.Size;
   
   public class _0K_6 extends Sprite
   {
       
      
      private const _1iz:int = 20;
      
      private var _M_r:Vector.<DisplayObject>;
      
      private var _0P_X_:_14v;
      
      public function _0K_6()
      {
         var _loc1_:int = 0;
         this._M_r = new Vector.<DisplayObject>(this._1iz);
         this._0P_X_ = new _14v();
         super();
         while(_loc1_ < this._1iz)
         {
            this._M_r[_loc1_] = new ArenaLeaderboardListItem();
            _loc1_++;
         }
         this._0P_X_.setSize(new Size(786,400));
         addChild(this._0P_X_);
      }
      
      public function setItems(param1:Vector.<_083>, param2:Boolean) : void
      {
         var _loc3_:_083 = null;
         var _loc4_:ArenaLeaderboardListItem = null;
         var _loc5_:int = 0;
         while(_loc5_ < this._M_r.length)
         {
            _loc3_ = _loc5_ < param1.length?param1[_loc5_]:null;
            _loc4_ = this._M_r[_loc5_] as ArenaLeaderboardListItem;
            _loc4_.apply(_loc3_,param2);
            _loc5_++;
         }
         this._0P_X_.setItems(this._M_r);
      }
   }
}
