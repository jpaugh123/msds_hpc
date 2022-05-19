Environment Modules (generally used on super computers):

<https://spack.readthedocs.io/en/latest/module_file_support.html#modules>

Architecture specifiers

**$** spack install libelf target=broadwell

Reserved words ; platform, os, target

Or reserved word arch:

**$** spack install libelf arch=cray-CNL10-haswell

Normally users don’t have to bother specifying the architecture if they are installing software for their current host, as in that case the values will be detected automatically.

Spack knows how to detect and optimize for many specific microarchitectures (including recent Intel, AMD and IBM chips) and encodes this information in the target portion of the architecture specification

spack arch --known-targets

Ran:

spack install gcc

Waiting on 

**==>** gcc: Executing phase: 'build'




Run

cat /proc/cpuinfo

Intel(R) Xeon(R) CPU E5-2680 v4 @ 2.40GHz

<https://www.intel.com/content/www/us/en/products/sku/91754/intel-xeon-processor-e52680-v4-35m-cache-2-40-ghz/specifications.html>

Products formerly Broadwell

<https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html>

‘x86-64-v2’

‘x86-64-v3’

‘x86-64-v4’

These choices for cpu-type select the corresponding micro-architecture level from the x86-64 psABI. On ABIs other than the x86-64 psABI they select the same CPU features as the x86-64 psABI documents for the particular micro-architecture level.

Since these cpu-type values do not have a corresponding -mtune setting, using -march with these values enables generic tuning. Specific tuning can be enabled using the -mtune=other-cpu-type option with an appropriate other-cpu-type value.

<https://www.phoronix.com/scan.php?page=news_item&px=GCC-11-x86-64-Feature-Levels>

<https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level>




- **x86-64-v2** brings support (among other things) for vector instructions up to Streaming SIMD Extensions 4.2 (SSE4.2)  and Supplemental Streaming SIMD Extensions 3 (SSSE3), the POPCNT instruction (useful for data analysis and bit-fiddling in some data structures), and CMPXCHG16B (a two-word compare-and-swap instruction useful for concurrent algorithms).
- **x86-64-v3** adds vector instructions up to AVX2, MOVBE (for big-endian data access), and additional bit-manipulation instructions.
- **x86-64-v4** includes vector instructions from some of the AVX-512 variants.

<https://www.intel.com/content/www/us/en/products/sku/91754/intel-xeon-processor-e52680-v4-35m-cache-2-40-ghz/specifications.html>

Instruction Set Extensions 

Intel® AVX2

So looks like we want v3

[jpaugh@login03 spackenv]$ spack list panda

**==>** 5 packages.

panda  pandaseq  py-biopandas  py-geopandas  py-pandas

[jpaugh@login03 spackenv]$ spack list matplotlib

**==>** 2 packages.

py-matplotlib  py-matplotlib-inline

[jpaugh@login03 spackenv]$

