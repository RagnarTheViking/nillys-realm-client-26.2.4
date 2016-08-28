package _18
{
   import flash.display.Sprite;
   import _1O_n._1S_u;
   import _05g._0s6;
   import com.company.assembleegameclient.objects.Player;
   import _S_b._1K_S_;
   import _1pm._1Y_F_;
   
   public class _1o0 extends Sprite
   {
       
      
      private var _0J_9:Sprite;
      
      private var _1ke:_1S_u;
      
      private var _0tm:_0s6;
      
      public function _1o0(param1:Player)
      {
         this._0J_9 = new Sprite();
         this._0tm = new _0s6();
         super();
         this.init(param1);
         this._0sF_();
         this._6P_();
      }
      
      private function init(param1:Player) : void
      {
         this._0J_9.name = _1K_S_._069;
         this._1ke = new _1S_u(param1,param1,_1Y_F_._J_p + _1Y_F_._16J_,true);
      }
      
      private function _6P_() : void
      {
         this._0J_9.x = 7;
         this._0J_9.y = 7;
         this._0tm.y = this._1ke.height + 4;
      }
      
      private function _0sF_() : void
      {
         this._0J_9.addChild(this._1ke);
         this._0J_9.addChild(this._0tm);
         addChild(this._0J_9);
      }
   }
}
