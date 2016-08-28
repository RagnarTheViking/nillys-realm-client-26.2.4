package com.company.assembleegameclient.map
{
   import flash.utils.getTimer;
   import com.company.assembleegameclient.objects.GameObject;
   
   public class Quest
   {
       
      
      public var map_:com.company.assembleegameclient.map.Map;
      
      public var objectId_:int = -1;
      
      private var _1zy:int = 0;
      
      private var _1M_G_:int = 0;
      
      public function Quest(param1:com.company.assembleegameclient.map.Map)
      {
         super();
         this.map_ = param1;
      }
      
      public function setObject(param1:int) : void
      {
         if(this.objectId_ == -1 && param1 != -1)
         {
            this._1zy = getTimer() + 4000;
            this._1M_G_ = this._1zy + 2000;
         }
         this.objectId_ = param1;
      }
      
      public function completed() : void
      {
         this._1zy = getTimer() + 15000 - Math.random() * 10000;
         this._1M_G_ = this._1zy + 2000;
      }
      
      public function getObject(param1:int) : GameObject
      {
         return this.map_.goDict_[this.objectId_];
      }
      
      public function isNew(param1:int) : Boolean
      {
         return param1 < this._1M_G_;
      }
   }
}
