package _1hC_
{
   import flash.events.Event;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   
   public class _1fX_ extends Event
   {
      
      public static const DELETE_CHARACTER_EVENT:String = "DELETE_CHARACTER_EVENT";
       
      
      public var savedChar_:SavedCharacter;
      
      public function _1fX_(param1:SavedCharacter)
      {
         super(DELETE_CHARACTER_EVENT);
         this.savedChar_ = param1;
      }
   }
}
