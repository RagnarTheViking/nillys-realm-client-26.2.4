package _11G_
{
   import _v4._1K_N_;
   import _m2._1N_l;
   import _1T_4._kc;
   import _1T_4._1U_z;
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.GameSprite;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   
   public class _0h9
   {
       
      
      [Inject]
      public var _1h:_1K_N_;
      
      [Inject]
      public var update:_1N_l;
      
      [Inject]
      public var _11v:_kc;
      
      [Inject]
      public var _0rh:_1U_z;
      
      public function _0h9()
      {
         super();
      }
      
      public function execute() : void
      {
         this.update.dispatch();
         this._11v.dispatch();
         this._0rh.dispatch(this._4V_());
      }
      
      private function _4V_() : Sprite
      {
         var _loc1_:Class = this._1h._1Z_z();
         if(_loc1_ == null || _loc1_ == GameSprite)
         {
            _loc1_ = CharacterSelectionAndNewsScreen;
         }
         return new _loc1_();
      }
   }
}
