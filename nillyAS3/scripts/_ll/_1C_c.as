package _ll
{
   import flash.media.SoundTransform;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.googleanalytics.GA;
   
   public class _1C_c
   {
      
      private static var _0lQ_:SoundTransform;
       
      
      public function _1C_c()
      {
         super();
      }
      
      public static function load() : void
      {
         _0lQ_ = new SoundTransform(!!Parameters.data_.playSFX?Number(1):Number(0));
      }
      
      public static function _U_d(param1:Boolean) : void
      {
         GA.global().trackEvent("sound",!!param1?"soundOn":"soundOff");
         Parameters.data_.playSFX = param1;
         Parameters.save();
         SFX.toggle();
      }
   }
}
