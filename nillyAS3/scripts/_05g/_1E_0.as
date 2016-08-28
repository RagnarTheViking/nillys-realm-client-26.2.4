package _05g
{
   import _P_S_.Mediator;
   import com.company.assembleegameclient.screens.charrects.CharacterRectList;
   import _1T_4._1U_z;
   import _K_r._1O_7;
   import _W_Q_._1R_U_;
   
   public class _1E_0 extends Mediator
   {
       
      
      [Inject]
      public var view:CharacterRectList;
      
      [Inject]
      public var _0rh:_1U_z;
      
      [Inject]
      public var _1Q_u:_1O_7;
      
      public function _1E_0()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.newCharacter.add(this._06t);
         this.view.buyCharacterSlot.add(this._60);
      }
      
      override public function destroy() : void
      {
         this.view.newCharacter.remove(this._06t);
         this.view.buyCharacterSlot.remove(this._60);
      }
      
      private function _06t() : void
      {
         this._0rh.dispatch(new _1R_U_());
      }
      
      private function _60(param1:int) : void
      {
         this._1Q_u.dispatch(param1);
      }
   }
}
