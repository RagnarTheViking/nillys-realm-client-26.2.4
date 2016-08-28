package _0U_q
{
   import _P_S_.Mediator;
   import _0O_N_._1uf;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.utils.Dictionary;
   
   public class _0pQ_ extends Mediator
   {
       
      
      [Inject]
      public var _1N_V_:_1uf;
      
      [Inject]
      public var view:GameSprite;
      
      public function _0pQ_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._1N_V_.add(this._X_o);
      }
      
      override public function destroy() : void
      {
         this._1N_V_.remove(this._X_o);
      }
      
      private function _X_o(param1:String = "") : void
      {
         this.view.setFocus(this._1H_6(param1));
      }
      
      private function _1H_6(param1:String) : GameObject
      {
         var _loc2_:GameObject = null;
         if(param1 == "")
         {
            return this.view.map.player_;
         }
         var _loc3_:Dictionary = this.view.map.goDict_;
         for each(_loc2_ in _loc3_)
         {
            if(_loc2_.name_ == param1)
            {
               return _loc2_;
            }
         }
         return this.view.map.player_;
      }
   }
}
