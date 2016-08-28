package com.company.assembleegameclient.ui
{
   import _f7.Signal;
   import _1xa.SText;
   import _1xa._dU_;
   
   public class Button extends _1F___
   {
       
      
      public const textChanged:Signal = new Signal();
      
      public function Button(param1:int, param2:String, param3:int = 0, param4:Boolean = false)
      {
         super(param3);
         CreateText(param1);
         if(param4)
         {
            text_.setStringBuilder(new SText(param2));
         }
         else
         {
            text_.setStringBuilder(new _dU_().setParams(param2));
         }
         text_.textChanged.addOnce(this.onTextChanged);
      }
      
      protected function onTextChanged() : void
      {
         initText();
         this.textChanged.dispatch();
      }
   }
}
