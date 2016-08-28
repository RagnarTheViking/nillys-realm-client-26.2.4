package _ge
{
   import com.company.assembleegameclient.objects.Player;
   import flash.utils.Dictionary;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class _v1
   {
       
      
      public var player:Player;
      
      public var gameObjects:Dictionary;
      
      public function _v1()
      {
         super();
      }
      
      public function _0w2(param1:int) : GameObject
      {
         var _loc2_:GameObject = this.gameObjects[param1];
         if(!_loc2_ && this.player.objectId_ == param1)
         {
            _loc2_ = this.player;
         }
         return _loc2_;
      }
   }
}
