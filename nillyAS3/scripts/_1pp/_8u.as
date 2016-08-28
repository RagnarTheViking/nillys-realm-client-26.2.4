package _1pp
{
   import _1gF_.SimpleText;
   import flash.filters.DropShadowFilter;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class _8u
   {
       
      
      public function _8u()
      {
         super();
      }
      
      public static function _0M_n(param1:int, param2:int, param3:Boolean, param4:Boolean = false) : SimpleText
      {
         var _loc5_:SimpleText = new SimpleText();
         _loc5_.setSize(param2).setColor(param1).setBold(param3);
         _loc5_.setVerticalAlign(SimpleText.BOTTOM);
         _loc5_.filters = !!param4?[new DropShadowFilter(0,0,0)]:[];
         return _loc5_;
      }
      
      public static function _1lz(param1:uint) : Bitmap
      {
         return new Bitmap(ObjectLibrary.getRedrawnTextureFromType(param1,80,true));
      }
   }
}
