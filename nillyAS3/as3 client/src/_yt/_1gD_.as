package _yt
{
   import com.company.assembleegameclient.ui._1F___;
   import _1gF_.SimpleText;
   import _1gF_._I_a;
   import _1xa._dU_;
   
   public class _1gD_ extends _1F___
   {
       
      
      public function _1gD_(param1:int, param2:String, param3:int = 0)
      {
         super(param3);
         CreateText(param1);
         text_.setStringBuilder(new _dU_().setParams(param2));
         initText();
      }
      
      override protected function makeText() : SimpleText
      {
         return new _I_a();
      }
   }
}
