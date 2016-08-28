package _G_Z_
{
   import _P_S_.Command;
   import _1F_z._0P_4;
   import _1F_z._A_H_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _1F_z._1Z_D_;
   
   public class _0hn extends Command
   {
       
      
      [Inject]
      public var model:_0P_4;
      
      [Inject]
      public var data:XML;
      
      public function _0hn()
      {
         super();
      }
      
      override public function execute() : void
      {
         if(this.data.Account.hasOwnProperty("PetYardType"))
         {
            this.model._0C_9(this._0bf());
         }
         if(this.data.hasOwnProperty("Pet"))
         {
            this.model._1mB_(this._8Z_());
         }
      }
      
      private function _0bf() : int
      {
         var _loc1_:String = _A_H_._162(this.data.Account.PetYardType).value;
         var _loc2_:XML = ObjectLibrary._0W_b(_loc1_);
         return _loc2_.@type;
      }
      
      private function _8Z_() : _1Z_D_
      {
         var _loc1_:XMLList = this.data.Pet;
         var _loc2_:_1Z_D_ = this.model.getPetVO(_loc1_.@instanceId);
         _loc2_.apply(_loc1_[0]);
         return _loc2_;
      }
   }
}
