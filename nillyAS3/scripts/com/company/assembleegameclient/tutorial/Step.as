package com.company.assembleegameclient.tutorial
{
   public class Step
   {
       
      
      public var text_:String;
      
      public var action_:String;
      
      public var _1H_G_:Vector.<com.company.assembleegameclient.tutorial.UIDrawBox>;
      
      public var _1U_B_:Vector.<com.company.assembleegameclient.tutorial.UIDrawArrow>;
      
      public var _j:Vector.<com.company.assembleegameclient.tutorial.Requirement>;
      
      public var _1I_K_:int = 0;
      
      public function Step(param1:XML)
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         this._1H_G_ = new Vector.<com.company.assembleegameclient.tutorial.UIDrawBox>();
         this._1U_B_ = new Vector.<com.company.assembleegameclient.tutorial.UIDrawArrow>();
         this._j = new Vector.<com.company.assembleegameclient.tutorial.Requirement>();
         super();
         for each(_loc2_ in param1.UIDrawBox)
         {
            this._1H_G_.push(new com.company.assembleegameclient.tutorial.UIDrawBox(_loc2_));
         }
         for each(_loc3_ in param1.UIDrawArrow)
         {
            this._1U_B_.push(new com.company.assembleegameclient.tutorial.UIDrawArrow(_loc3_));
         }
         for each(_loc4_ in param1.Requirement)
         {
            this._j.push(new com.company.assembleegameclient.tutorial.Requirement(_loc4_));
         }
      }
      
      public function toString() : String
      {
         return "[" + this.text_ + "]";
      }
   }
}
