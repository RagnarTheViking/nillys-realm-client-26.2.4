package _0db
{
   import _v4.Client;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   
   public class _68 implements _1A_c
   {
       
      
      [Inject]
      public var _0gu:Client;
      
      private var selected:SavedCharacter;
      
      public function _68()
      {
         super();
      }
      
      public function _0L_o() : int
      {
         return this._0gu.getNumChars();
      }
      
      public function _nW_(param1:int) : SavedCharacter
      {
         return this._0gu._0qD_(param1);
      }
      
      public function deleteCharacter(param1:int) : void
      {
         this._0gu.deleteCharacter(param1);
         if(this.selected.charId() == param1)
         {
            this.selected = null;
         }
      }
      
      public function select(param1:SavedCharacter) : void
      {
         this.selected = param1;
      }
      
      public function _1H_j() : SavedCharacter
      {
         return this.selected;
      }
   }
}
