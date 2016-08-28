package _S_b
{
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _O_e
   {
       
      
      public var _14O_:GameSprite;
      
      public function _O_e()
      {
         super();
      }
      
      public function _A_e() : String
      {
         return !!this._14O_.model.getName()?this._14O_.model.getName():this._14O_.map.player_.name_;
      }
      
      public function _ae() : String
      {
         return this._14O_.gsc_.gameId_ == Parameters._1lr?"OPTIONS_BUTTON":"NEXUS_BUTTON";
      }
   }
}
