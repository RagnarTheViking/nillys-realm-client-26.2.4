package com.company.assembleegameclient.tutorial
{
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class Requirement
   {
       
      
      public var type_:String;
      
      public var _08g:int = -1;
      
      public var objectType_:int = -1;
      
      public var _g5:String = "";
      
      public var radius_:Number = 1;
      
      public function Requirement(param1:XML)
      {
         super();
         this.type_ = String(param1);
         var _loc2_:String = String(param1.@objectId);
         if(_loc2_ != null && _loc2_ != "")
         {
            this.objectType_ = ObjectLibrary._07h[_loc2_];
         }
         this._g5 = String(param1.@objectName).replace("tutorial_script","tutorial");
         if(this._g5 == null)
         {
            this._g5 = "";
         }
         this._08g = int(param1.@slot);
         this.radius_ = Number(param1.@radius);
      }
   }
}
