package _ge
{
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _1M_O_
   {
       
      
      public function _1M_O_()
      {
         super();
      }
      
      public function _C_u(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1 == null)
         {
            return true;
         }
         if(param1 == Parameters.InfoText || param1 == Parameters.HelpText || param1 == Parameters.ErrorText || param1 == Parameters.ClientText)
         {
            _loc2_ = true;
         }
         if(param1.charAt(0) == "#")
         {
            _loc2_ = true;
         }
         if(param1.charAt(0) == "@")
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
   }
}
