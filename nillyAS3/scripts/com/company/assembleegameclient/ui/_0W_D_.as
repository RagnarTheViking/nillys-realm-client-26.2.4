package com.company.assembleegameclient.ui
{
   import _f7.Signal;
   import _1xa.SText;
   
   public class _0W_D_ extends _1F___
   {
       
      
      public const textChanged:Signal = new Signal();
      
      public function _0W_D_(param1:int, param2:String, param3:int = 0)
      {
         super(param3);
         CreateText(param1);
         text_.setStringBuilder(new SText(param2));
         text_.textChanged.addOnce(this.onTextChanged);
      }
      
      protected function onTextChanged() : void
      {
         initText();
         this.textChanged.dispatch();
      }
   }
}
